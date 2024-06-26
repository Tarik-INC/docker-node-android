![Docker Pulls](https://img.shields.io/docker/pulls/tkdps/node-android?style=for-the-badge)
![Docker image size](https://img.shields.io/docker/image-size/tkdps/node-android?arch=amd64&style=for-the-badge&color=green)
![Docker last version tag](https://img.shields.io/docker/v/tkdps/node-android/1.0.0?arch=amd64&style=for-the-badge&color=red)
![Repo License](https://img.shields.io/github/license/Tarik-INC/docker-node-android?style=for-the-badge&color=gold)


# docker-node-android
Build first for a personal Gitalb CI/CD solution, this docker image is capable of executing node based applications together with the possibility of building native Android mobile apps (Ionic and React Native based projects for example).

## Tools versions 
- Java **17.0.2**
- Android **API 33** (Android 13 Tiramisu)
- Node latest LTS (**20.1.31**) amd64 
- Debian **10** (Buster)


## Pull or run the image 

```bash

docker pull tkdps/node-android:1.0.0

docker run --rm --name node-android -it tkdps/node-android:1.0.0 

```

## Base image
- In a dockerfile:
```Dockerfile
FROM tkdps/node-android:1.0.0
```
- In a Gitlab CI yaml file:
```yaml
image: tkdps/node-android:1.0.0
```

## Misc
Docker hub link: https://hub.docker.com/r/tkdps/node-android
