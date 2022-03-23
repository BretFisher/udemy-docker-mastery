# What is Docker? Three Major Innovations

Welcome, or should I say whale-come, to the future of software management.

> Docker friends logo

Today docker is lots of things, but this video is focused on its three major innovations that changed the software world

> lists all three

Docker aids you in packaging an application (with *all* its dependencies)

it helps to distribute that app around to all the places you need to run it

and finally, run that app in a highly reproducible way.

> build, ship and run

Docker Inc. calls this "Build, Ship and Run".

These are the basics that all other container technology is built on, Kubernetes, Swarm, Helm and most the Cloud Native tooling assumes you're using these three innovations.

We’ll learn a lot more about these three innovations in this course

so for now, let’s briefly give you the basics, starting with the container image

> back to list of three, highlighting the first

1. Universal app packaging
    1. It’s called a Docker container image, or just image for short
    2. docker uses a list instructions, called a Dockerfile,
    3. which is similar to a shell script, and it layers those instructions on top of each other until it has everything you need to run the application, including all its system dependencies.
    4. If it was a Python app you wanted to build, then the image would contain the app itself, all the Python dependencies the app needs, maybe with pip.
    5. They key distinction is it also include the exact Python version and system libraries to correctly run Python.
    6. Everything except the OS kernel and hardware drivers.
    7. 
2. Easy app running
    1. Called a Docker container, or just container for short
    2. Docker will launch your container image into a new running container and use the command you specified in the Dockerfile to start it
    3. It uses two Linux Kernel features, called Namespaces and Cgroups, to isolate your app, so it can’t see the rest of the host. To the app, the only files it sees are the ones in the container image. It sees no other processes outside the container and even gets its own virtual ethernet and IP.
    4. Now let me stress, It’s *not* virtualization. It’s application isolation, similar to FreeBSD Jails, Linux VServer, or Solaris Zones, which all came before Docker.
    5. You can start many of these containers from the same container image, on the same system, and they’ll all be isolated from each other. File changes in one container don’t affect the files in another.
3. Easy app distribution
    1. Called a Docker registry, or just registry for short.
    2. This innovation was the key to bringing it all together.
    3. Now that we have built an image, ran it on our local machine, how do we get it on all the other machines?
    4. How can I be sure that the rest of my team, my CI testing, and all my servers run the exact same image?
    5. The registry is a HTTP-based package manager that works like apt, yum, npm, and other package managers.
    6. You can *push* an image to it, and then *pull* an image somewhere else.
    7. And the registry protocol is efficient. It only pushes and pulls the changed parts, and stores the image in your local cache for fast running of new containers.
    8. Think of the images and the registry as the universal package manager for modern computing, where we may want to download and run any app on any system, including Linux, macOS, Windows, in the cloud, in your datacenter, or even on a mainframe or a tiny Raspberry Pi. They all work with Docker.

Now we’re gonna get into way more detail on those three things throughout this course.

Now that you know a bit about those three Docker innovations, you should understand *why* docker needed to exist, and what problems it solves. 

That’s next!

Further reading:

- [A Brief History of Containers: From the 1970s till now](https://blog.aquasec.com/a-brief-history-of-containers-from-1970s-chroot-to-docker-2016)