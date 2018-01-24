### STAGE 1: Build ###

FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

## Build the angular app in production mode and store the artifacts in dist folder
RUN npm run build


### STAGE 2: Setup ###

FROM nginx:alpine

## Copy our default nginx config
COPY nginx/default.conf /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## From 'builder' stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=builder /usr/src/app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
