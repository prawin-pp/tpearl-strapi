FROM node:lts-alpine as build

ARG NODE_ENV=development
ENV NODE_ENV=$NODE_ENV

RUN set -e; apk add --no-cache bash git

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:lts-alpine as server
ENV NODE_ENV=$NODE_ENV

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/node_modules /usr/src/app/node_modules
COPY --from=build /usr/src/app/package.json /usr/src/app/package-lock.json /usr/src/app/
COPY --from=build /usr/src/app/dist /usr/src/app/
COPY --from=build /usr/src/app/public /usr/src/app/public

CMD [ "npm", "start" ]
