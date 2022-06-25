FROM node:16-slim
WORKDIR /usr/src/app
RUN yarn init --yes --private
RUN yarn add firebase-tools
COPY package.json firebase.json ./
EXPOSE 4000
EXPOSE 9099
CMD yarn firebase emulators:start --project ${GCLOUD_PROJECT}
