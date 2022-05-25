# What is Docker? Three Major Innovations

> Nav: [Back to Intro Lectures](../README.md)

Welcome to the future of software management.

Today, docker is lots of things. This lecture is focused on Docker's original three innovations that changed the software world.

![Docker Friends](images/docker-friends.png)

Docker was not the inventor of containers, but it made them easier to use with the three steps to creating and running them:

1. Images: It aids you in packaging an application (with *all* its dependencies).
2. Registries: It helps to distribute that app around to all the places you need to run it.
3. Containers: It runs that app in a highly reproducible way.

Docker calls this the "Build, Ship and Run" lifecycle.

![Docker Build, Ship and Run](images/build-ship-run.excalidraw.png)

These are the basics that all other container technology is built on. Kubernetes, Swarm, Helm and [most the cloud native tooling](https://landscape.cncf.io/) assumes you're using these three innovations.

We’ll learn a lot more about these three innovations in this course, so for now, I'll give you the basics. Note that these three innovations now have standard specifications and are governed by the [Open Container Initiative (OCI)](https://opencontainers.org/about/overview/), which is part of the Linux Foundation.

## The Docker Image: Universal app packaging

![The Docker Image](images/image-basics.excalidraw.png)

1. It’s called a "Docker image", the standards name "OCI Image", or just "image" for short.
2. Docker uses a list instructions, called a Dockerfile, which is similar to a shell script, and it layers those instructions on top of each other until it has everything you need to run the application, including all its system dependencies.
3. Including the dependencies is a key differentiator between Docker and many previous packaging systems. It helps prevent the (only) "works on my machine" problem of two different environments having slightly different sets of dependencies.
4. If it was a Python app you wanted to build, then the image would contain the app itself, all the Python dependencies the app needs.
5. They key distinction is it also include the exact Python version and system libraries to correctly run Python.
6. Everything except the OS kernel and hardware drivers is included. Even metadata on how to start the app, default environment variables, and what ports it listens on are included.

## The Registry: Easy app distribution

![The Docker Registry](images/registry-basics.excalidraw.png)

1. Called a "Docker registry", or just "registry" for short.
1. This innovation was the key to connecting our building of images on one machine to running our containers on another.
1. Now that we have built an image, ran it on our local machine, how do we get it on all the other machines?
1. How can I be sure that the rest of my team, my CI testing, and all my servers run the exact same image?
1. The registry is a HTTP-based package manager that works like apt, yum, npm, and other package managers.
1. You can *push* an image to it, and then *pull* an image somewhere else.
1. The registry protocol is efficient. It only pushes and pulls the changed parts (layers), and stores the image in the machines local cache for fast running of new containers.

> Think of the images and the registry as the universal package manager for modern computing, where we may want to build, download, and run any app on any system. This includes building and running on Linux, macOS, Windows, in the cloud, in your datacenter, on a mainframe, or a tiny Raspberry Pi. They all work with Docker.

## The Docker Container: Easy app running

![The Docker Container](images/container-basics.excalidraw.png)

 1. Called a "Docker container", the standards name "OCI Container", or just "container" for short. It's **not** called a "docker", or "dockers". Docker is many things.
 2. Docker will launch your container image into a new running container and use the command you specified in the Dockerfile to start it.
 3. It uses two Linux Kernel features, called namespaces and cgroups (control groups), to isolate your app so it can’t see the rest of the host by default. To the app, the only files it sees are the ones in the container image. It sees no other processes outside the container and even gets its own virtual ethernet adapter and private IP.
 4. Now let me stress, It’s *not* virtualization. It’s application isolation, similar to chroot, FreeBSD jails, or Solaris zones, which all came before Docker.
 5. You can start many of these containers from the same container image, on the same system, and they’ll all be isolated from each other. File changes in one container don’t affect the files in another.

> Nav: [Back to Intro Lectures](../README.md)

## Further reading

- [Kubernetes vs. Docker (bretfisher.com)](https://www.bretfisher.com/kubernetes-vs-docker/)
- [OCI Overview](https://opencontainers.org/about/overview/)
