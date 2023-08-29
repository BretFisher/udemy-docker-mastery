# Container Images, Where To Find Them and How To Build Them

## The Mighty Hub: Using Docker Hub Registry Images

http://hub.docker.com

docker image ls

docker pull nginx

docker pull nginx:1.11.9

docker pull nginx:1.11

docker pull nginx:1.11.9-alpine

docker image ls

## Images and Their Layers: Discover the Image Cache

docker image ls

docker history nginx:latest

docker history mysql

docker image inspect nginx

## Image Tagging and Pushing to Docker Hub

docker image tag -- help

docker image ls

docker pull mysql/mysql-server

docker image ls

docker pull nginx:mainline

docker image ls

docker image tag nginx bretfisher/nginx

docker image tag --help

docker image ls

docker image push bretfisher/nginx

docker --help

docker login

cat .docker/config.json

docker image push bretfisher/nginx

docker image push bretfisher/nginx bretfisher/nginx:testing

docker image ls

docker image push bretfisher/nginx:testing

docker image ls

## Building Images: The Dockerfile Basics

cd dockerfile-sample-1

vim Dockerfile

## Building Images: Running Docker Builds

docker image build -t customnginx .

docker image ls

docker image build -t customnginx .

## Building Images: Extending Official Images

cd dockerfile-sample-2

vim Dockerfile

docker container run -p 80:80 --rm nginx

docker image build -t nginx-with-html .

docker container run -p 80:80 --rm nginx-with-html

docker image ls

docker image tag --help

docker image tag nginx-with-html:latest bretfisher/nginx-with-html:latest

docker image ls

docker push

## Assignment Answers: Build Your Own Dockerfile and Run Containers From It

cd dockerfile-assignment-1

vim Dockerfile

docker build cmd

docker build -t testnode .

docker container run --rm -p 80:3000 testnode

docker images

docker tag --help

docker tag testnode bretfisher/testing-node

docker push --help

docker push bretfisher/testing-node

docker image ls

docker image rm bretfisher/testing-node

docker container run --rm -p 80:3000 bretfisher/testing-node
