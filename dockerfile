FROM node:lts-buster

# Set environment variables
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools


# Install required dependencies
RUN apt-get update && apt-get upgrade && apt-get install -y \
  bash \
  curl \
  unzip \
  wget \
  gradle

RUN wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz \
  && tar xvf openjdk-17.0.2_linux-x64_bin.tar.gz \
  && mv jdk-17*/ /opt/jdk17 \
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/opt/jdk17
ENV PATH=${PATH}:${JAVA_HOME}/bin


# Download and install Android SDK Command Line Tools
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
  && cd ${ANDROID_SDK_ROOT}/cmdline-tools \
  && wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O commandlinetools.zip \
  && unzip commandlinetools.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools \
  && mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/latest \
  && rm commandlinetools.zip

# Accept Android SDK licenses
RUN yes | sdkmanager --licenses


# Install essential Android SDK packages
RUN sdkmanager "platform-tools" "platforms;android-33" "build-tools;34.0.0"

#clean apt get
RUN apt-get autoremove -y && \
  apt-get clean

# Verify installations
RUN node -v && npm -v && java -version && sdkmanager --list

# Set working directory
WORKDIR /workspace

CMD ["bash"]
