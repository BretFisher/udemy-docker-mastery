### Commands 

There are management command and subcommands. 
To run docker run you know run docker container run, for example. 

- docker version: verifies that the cli can talk to the engine 
- docker info: most config values of engine 

### Nginx

### Image vs Container 

- Image is the binaries and source code that make your application 
- A container is an instance of that image running as a process
- You can have many containers running off the same image
- In this example, the image is the Nginx web server 
- Docker's default image 'registry' is called Docker Hub (hub.docker.com )


docker container run --publish 80:80 nginx
In the background, the docker engine looked for an image called nginx and it pulled down the latest image for nginx from docker hub and then it started it as a new process in a new container. 
The publish part of the command exposes my localport 80 from my local machine and sends all traffic form it to the executable running inside that container on port 80. Since nginx is a webserver it will default to port 80. The traffic forwards automatically to my browser, to my localhost, to my container.  

--detach tells docker to run it in the bakcround and we get back the unique container ID of our container. Everytime you run a new container you get a new unique ID. 

docker container ls
lists our containers 

What happens in 'docker container run'?
In the background it's going to look for the image that we specified in the end of the command. It will look for that locally in the image cache. If it doesn't find anything. then it will hop over to docker hub and will look it up there and download it (the latest version unless otherwise specified) and store it in the image cache. It will start a new container based on that image, it will start a new layer of changes on top of where that image left off, it will customise the networking. It will give it a virtual IP on a private network inside docker engine. It will open up the specified port and forward it to the other specified host in the container. Then that container will start. 

### Containers are not Virtual Machines 
- Containers are processes running on your host operating system (linux)


- docker container top: process list in one container 
- docker container inspect: details of one container config 
- docker container stats: performance stats for all containers 

- docker container run -it : start new container interactively 
docker container exec -it : run additional command in existing container 

- -it is 2 separate options. The 't' gives you a sudo TTY. The 'i' allows us to keep that session open to keep running more commands. 
``docker container run -it --name proxy nginx bash``

Ubuntu image: Its default CMD is bash, so there is no need to specify it 

`docker container run -it --name ubuntu ubuntu`

A ubuntu container is a minimal version of ubuntu but you can install more things to it. 

To re-run a container, we can use the docker container start -ai [name] 

What if I wanted to see the shell inside a running container that is inside a running container that is already running mysql or nginx? We can use `docker container exec -it mysql bash`. This will run an additional process, so when you exit the bash, the mysql container will still be running. 

To see the processes that are running you can run `ps aux` but the ps command is no longer included int he mysql image by default. You can install it once you're in the container with `apt-get update && apt-get install -y procps`

This is good for changing settings inside a running container. 

Alpine is another distribution of linux, only 5mb in size. It also comes with its own package manager. Bash is not in the Alpine container. To get in the Alpine image, you can use sh and then once you are in the container you can install bash. 


### Docker Networks: Concepts 

- `docker container run -p` -p option exposes the port on your machine. 

- Docker has a concept of batteries included but removable, the defaults are pretty easy and common to work with but you can change a lot of the options under the hood. 

- The contianer port command lists which ports are open on your network for that container 


When you start a container you are really in the background connecting to a particular docker network and by default that is the bridge network. Each one of those networks actually routes out through a NAT firewall , which is the docker Deamon configuring the host IP address on its default interface so that the docker containers can get out to the internet or to the rest of your network and get back. We don't have to use the -p when we have specific containers wanting to talk to each other inside our host. 
For example, an application that has a sql server and php those should be able to talk to each other without using the -p.

- You can make new virutal networks 
- Attach containers to more than one virtual netowrk (or none)
- Skip virtual networks and use host IP (--net=host)
- User different Docker network drivers to gain new abilities

By default, the IP address of the container is not the same as the IP address of the host. 

`docker container inspect --format '{{ .NetworkSettings.IPAddress }}' webhost`

Why does this happen?

