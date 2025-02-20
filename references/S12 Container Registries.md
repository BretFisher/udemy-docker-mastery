# Container Registries: Image Storage and Distribution

## Docker Hub: Digging Deeper

https://hub.docker.com

## Docker Store: What Is It For?

https://store.docker.com

## Docker Cloud: CI/CD and Server Ops

https://cloud.docker.com

https://hub.docker.com

## Understanding Docker Registry

https://github.com/docker/distribution

https://hub.docker.com/registry

## Run a Private Docker Registry

docker container run -d -p 5000:5000 --name registry registry

docker container ls

docker image ls

docker pull hello-world

docker run hello-world

docker tag hello-world 127.0.0.1:5000/hello-world

docker image ls

docker push 127.0.0.1:5000/hello-world

docker image remove hello-world

docker image remove 127.0.0.1:5000/hello-world

docker container rm admiring_stallman

docker image remove 127.0.0.1:5000/hello-world

docker image ls

docker pull 127.0.0.1:5000/hello-world:latest

docker container kill registry

docker container rm registry

docker container run -d -p 5000:5000 --name registry -v $(pwd)/registry-data:/var/lib/registry registry TAB COMPLETION

docker image ls

docker push 127.0.0.1:5000/hello-world

## Using Docker Registry With Swarm

http://play-with-docker.com

docker node ls

docker service create --name registry --publish 5000:5000 registry

docker service ps registry

docker pull hello-world

docker tag hello-world 127.0.0.1:5000/hello-world

docker push 127.0.0.1:5000/hello-world

docker pull nginx

docker tag nginx 127.0.0.1:5000/nginx

docker push 127.0.0.1:5000/nginx

docker service create --name nginx -p 80:80 --replicas 5 --detach=false 127.0.0.1:5000/nginx

docker service ps nginx
