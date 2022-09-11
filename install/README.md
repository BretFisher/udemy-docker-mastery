# Docker and Kubernetes Install Options

How you get Docker and Kubernetes on your machine has changed drastically over the years. Today you have over a dozen ways to run these tools locally and nearly 100 ways to run them on servers.  In the end, all these tools and distributions run OCI-compliant containers from OCI-images, as you learned in the [first section](/intro/).

I'm going to focus on the official and most straightforward ways to do this for now, and I'll point you to alternate tools and distributions if you want to learn more.

## Docker's current tool list

After years of Docker Inc. making products and then deprecating them, they've narrowed down the toolset to just a few that you need to think about:

- Docker Desktop (Windows, macOS, Linux)
- Docker Engine (Linux)
- Docker CLI (Windows, macOS, Linux)
- Docker Compose V2 (Windows, macOS, Linux)
- Docker Desktop Extensions
- BuildKit
- Docker Hub
- Containerd
- Docker Bake
- Docker Registry (Distribution)
- Docker Bench
- Docker Notary
- Docker Hub-tool
- Docker Scan
- Docker SBOM

## Docker legacy and deprecated products

- Docker Machine
- Docker Toolbox (replaced by Docker Desktop)
- docker-compose CLI V1 (replaced by V2 Docker Compose plugin)
- Docker Store (2018)
- Docker Cloud (2018)
- Docker App Plugin
- Docker Community Edition & Enterprise Edition (just the names/terms)
- Docker Engine for Windows Containers (replaced by Mirantis Container Runtime aka MCR)
- Docker Enterprise (replaced by Mirantis Kubernetes Engine)
- Kitematic (replaced by Docker Desktop Dashboard)
- Docker Engine [Feature Deprecation list](https://docs.docker.com/engine/deprecated/)

## Section 3 Lectures

- S03-01 What Docker Tools do you need?
  - Section Goal: Setup Docker & supporting tools for this course
  - Lots of ways to run Docker
  - Docker Inc now focuses on local Docker Desktop
  - Docker Desktop is the best tool for local containers
  - Docker Desktop is not for servers
  - Docker Desktop is free for learning
  - Docker Engine + CLI is what you install on a Linux server
  - The next lecture has links for each OS
  
  - Why a whole section on installing Docker?
  - Linux containers require a Linux Kernel (OS)
  - macOS and Windows will need a Linux VM
  - Many container tools manage a tiny Linux VM
  - Docker is many things
  - Docker Engine = OCI Container Runtime
  - (OCI website)
  - Lots of ways to run *Containers*
  - Three major ways to run containers
  - Docker Desktop is best for local containers on Windows, macOS, and Linux
  - Docker Desktop includes many tools
  - (docker desktop about)

  - (dd alts)
- S03-02 Installing Docker: The Fast Way (written)
- S03-03 Windows Setup and Tips
- S03-04 macOS Setup and Tips
- S03-05 Linux Desktop Setup and Tips
- S03-06 Linux Server Setup and Tips
- S03-07 Terminal Shell and Tab Completion for Docker CLI (written)
- S03-08 Docker Version and Product Changes (written)

## Useful Docker Desktop links

- [Docker Desktop download](https://docs.docker.com/get-docker/)
- [Docker Desktop licensing](https://www.docker.com/pricing/)
- [Docker Desktop vs Docker Engine](https://www.docker.com/products/docker-desktop/alternatives/)
- [Docker Desktop Alternatives For Local Container Running](https://docs.google.com/spreadsheets/d/1ZT8m4gpvh6xhHYIi4Ui19uHcMpymwFXpTAvd3EcgSm4/edit#gid=0)
