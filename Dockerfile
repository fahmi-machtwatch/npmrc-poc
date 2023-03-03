FROM node:18-alpine as dependencies
WORKDIR /app
COPY package.json package-lock.json ./
COPY .npmrc.dockerfile ./.npmrc

# build env
ENV NPM_TOKEN=yourenvaccesstoken

COPY . .
RUN npm install
RUN npm run build

RUN npm install -g add http-server
CMD [ "http-server", "-c", "-1", "--port", "3000", "build" ]
