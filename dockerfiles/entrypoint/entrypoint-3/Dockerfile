# syntax=docker/dockerfile:1
#FROM chainguard/node
FROM node:slim

WORKDIR /app

# Add Tini
ENV TINI_VERSION=v0.19.0
ADD --chmod=555 https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /tini
# ENTRYPOINT ["/tini", "--"]

COPY . .

RUN npm ci

# ENTRYPOINT [""]

ENTRYPOINT ./cmd.sh
#CMD ["node", "index.js"]