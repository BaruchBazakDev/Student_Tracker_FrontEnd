FROM node:14.17.3-slim AS build
WORKDIR /app
RUN npm i -g npm@7.20.6 && apt -y update && apt install -y git
COPY . .
RUN npm install && npm run build
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
