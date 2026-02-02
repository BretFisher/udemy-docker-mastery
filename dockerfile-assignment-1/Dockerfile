# use this empty Dockerfile to build your assignment

# NOTE: The instructions are now in the README.md file in this directory.

FROM node:24-alpine3.20

WORKDIR /app

COPY package.json package.json

RUN apk add --no-cache tini

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "/sbin/tini", "--", "node", "./bin/www" ]