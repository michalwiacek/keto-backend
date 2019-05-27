FROM node:11.14.0

ARG UID
RUN adduser frontend --uid $UID --disabled-password --gecos ""

ENV APP /usr/src/app
RUN mkdir $APP
WORKDIR $APP

COPY package.json package-lock.json $APP/
RUN npm install

COPY . $APP/

CMD ["npm", "run", "dev"]