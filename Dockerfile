FROM node:16-slim
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends \
  openjdk-11-jre \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN yarn global add firebase-tools
RUN firebase setup:emulators:database
RUN firebase setup:emulators:firestore
RUN firebase setup:emulators:pubsub
RUN firebase setup:emulators:storage
RUN firebase setup:emulators:ui
COPY firebase.json ./
EXPOSE 9099
EXPOSE 9000
EXPOSE 8080
EXPOSE 5001
EXPOSE 5000
EXPOSE 4400
EXPOSE 4500
EXPOSE 8085
EXPOSE 9199
EXPOSE 4000
ENV FIREBASE_TOKEN demo-firebase-token
ENV GCLOUD_PROJECT demo-glcoud-project
ENV EMULATORS auth
CMD firebase emulators:start --project ${GCLOUD_PROJECT} --only ${EMULATORS}
