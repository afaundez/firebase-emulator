# Firebase Emulator Docker Image

## Build

```sh
docker build -t firebase-emulator .
```

## Run

```sh
docker run -it -p 4000:4000 -p 9099:9099 -e FIREBASE_TOKEN=<your login token> -e GCLOUD_PROJECT=<your project id> firebase-emulator
```