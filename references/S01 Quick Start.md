# Quick Start!

> Shell commands and reference links, per lecture

## What is Docker? The Three Innovations

- [Article of this lecture](https://github.com/BretFisher/udemy-docker-mastery/blob/main/intro/what-is-docker/what-is-docker.md)
- [Kubernetes vs. Docker](https://www.bretfisher.com/kubernetes-vs-docker/)
- [OCI Overview](https://opencontainers.org/about/overview/)

## Quick Container Run

- [Article of this lecture](https://github.com/BretFisher/udemy-docker-mastery/blob/main/intro/quick-container-run/quick-container-run.md)
- [Play with Docker](https://labs.play-with-docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [Docker Official Images](https://docs.docker.com/docker-hub/official_images/)
- [Apache Official Image (httpd)](https://hub.docker.com/_/httpd)

```shell
docker version
docker run -d -p 8800:80 httpd
curl localhost:8800
docker ps
docker run -d -p 8801:80 httpd
```

## Why Docker? Why Now?

- [Article of this lecture](https://github.com/BretFisher/udemy-docker-mastery/blob/main/intro/why-docker/why-docker.md)
- [A Brief History of Containers](https://blog.aquasec.com/a-brief-history-of-containers-from-1970s-chroot-to-docker-2016)
