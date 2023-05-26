FROM node:20.2.0-alpine3.17 as build
WORKDIR /build

COPY . .

RUN npm install && npm run build

FROM node:20.2.0-alpine3.17 as app
WORKDIR /app

COPY --from=build /build/dist /app
RUN npm install -g http-server
