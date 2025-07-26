# syntax=docker/dockerfile:1.4
FROM ubuntu as old-way

RUN apt-get update && \
 apt-get install -y curl && \
  apt-get clean


FROM ubuntu as new-way

RUN <<EOF
apt-get update
apt-get install -y curl
EOF