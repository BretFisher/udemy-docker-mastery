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
`docker container run -it --name proxy nginx bash`

In essence, tty is short for teletype, but it's more popularly known as terminal. It's basically a device (implemented in software nowadays) that allows you to interact with the system by passing on the data (you input) to the system, and displaying the output produced by the system.

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

### Docker Networks: CLI Management 

- Show network: docker network ls 
- Inspect a network: docker network inspect 
- Create a network: docker network create --driver
- Attach a network to container: docker network connect 
- Detach a network from container: docker network disconnect 

- Docker0 or bridge is the default docker virtual network, which is NAT'ed behind the HostIP 

- The host network is a special network that skips the the virtual network of docker but sacrifices security of container model 

- The --network none removes eth0 and only leaves you with localhost interface in container

- When you create a virtual network it will create it automatically with the driver 'bridge'. The 'bridge' network driver is a built-in or 3rd party extension that gives you virtual network features. It doens't have any of the advanced features. 

- You can add options to the 'docker network create' 

- You can use the --network option when you create a container `docker container run -d --name new_nginx --network my_app_net nginx`

- to connect and disconnect networks to containers and viceversa we use the `docker network connect` and `docker network disconnect` 

### Docker Networks: Default Security 

If you're runnin all of the applications on a single server, you are able to really protect them. In the physical work with vitual machine and hosts, we would overexpose the ports and networking on our application. If all the app containers were on one container, you would only be exposing the port that you use the -p with and everthing else would me a bit more protected. 

- Create your apps so frontend/backend sit on same Docker network 
- Their inter-communication never leaves host 
- All externally exposed ports closed by default 
- You must manually expose via -p, which is better default security!
- This get even better later with Swarm and Overlay networks 


### Docker Networks: DNS 

The Domain Name System is a hierarchical and decentralized naming system for computers, services, or other resources connected to the Internet or a private network. 

Forget IP's: Statis IP's and using IP's for talking to containers is an anti-pattern. Do your best to avoid it. 

The built-in solution for this is DNS Naming. Docker daemon has a built-in DNS server that containers use by default. 

To restart containers: `docker start  `docker ps -q -l` [name of continer]`

`docker container exec -t mynginx ping new_nginx`

The default bridge network has one disadvantage, it does not have the DNS server built-in by default so you can use the --link and specify manual links between continainer in that default link but it is much easier to create a new network for your apps so you don't have to do this every time. 

 the default bridge network driver allow containers to communicate with each other when running on the same docker host.

 cURL is a computer software project providing a library and command-line tool for transferring data using various network protocols. The name stands for "Client URL", which was first released in 1997.

### Assignment CLI App Testing 
- Use different Linux distro container to check curl cli tool version:
--rm: 
Removes all stopped containers
This command will delete all stopped containers. The command docker ps -a -q will return all existing container IDs and pass them to the rm command which will delete them. Any running containers will not be deleted.


`docker container run --rm -it centos:7 bash
// inside bash 
yum update curl`

YUM (Yellowdog Updater Modified) is an open source command-line as well as graphical based package management tool for RPM (RedHat Package Manager) based Linux systems. It allows users and system administrator to easily install, update, remove or search software packages on a systems.


- User two different terminal windows to start bash in both centos:7 and ubuntu:14.04, using -it 

`docker container run --rm -it ubuntu:14.04 bash`

- Learn the docker contianer --tm option so you can save cleanup


- Ensure curl is installed and on latest version for that distro 
  - `apt-get update && apt-get install curl` - for Ubuntu
  - centos: `yum update curl` 
- Check curl --version
` curl - v`
nslookup search. 

### Assigment: DNS RR Test 

nslookup search. 

- Know how to use -it to get shell in container 
- Understand basics of what a Linux distribution is like Ubuntu and CentOS
- Know how to run a containe r
- Understand basics of DNS records 

Task: 
DNS Round Robin is the concept that you can have 2 different hosts with DNS aliases and they respond to the same DNS name. 

- Ever since Docker Engine 1.11, we can have multiple containers on a created network respond to the same DNS address
- Create a new virtual network (default bridge driver)
`docker container run -d --net new_network --net-alias search elasticsearch:2`
- Create two containers from elasticsearsh:2 image 
elastic search is in a json format when you hit it from curl. 
- Research and use -network-alias search when creating them to give them an additional DNS name to respond to 
`docker container run --rm --net new_network alpine nslookup search.`
- Run alpine nslookup search. with --net to see the two containers list for the same DNS name. 
- Run centos curl -s search:9200 with --net multiple times until you see both name fields show
`docker container run --rm --net new_network centos curl -s search:9200`


### What is a load balancer?
Load balancing refers to efficiently distributing incoming network traffic across a group of backend servers, also known as a server farm or server pool.

Modern high‑traffic websites must serve hundreds of thousands, if not millions, of concurrent requests from users or clients and return the correct text, images, video, or application data, all in a fast and reliable manner. To cost‑effectively scale to meet these high volumes, modern computing best practice generally requires adding more servers.

In this manner, a load balancer performs the following functions:

Distributes client requests or network load efficiently across multiple servers
Ensures high availability and reliability by sending requests only to servers that are online
Provides the flexibility to add or subtract servers as demand dictates


### What's an image?

**An image is the application binaries and dependencies on your app and the metadata about the image data and how to run the image.**


Officially: "an image is an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime."

Inside the image, you can't find a complete OS. There is no kernel, no kernel modules like drivers, it's really just the binaries that your application needs because the host provides the kernel. 

An image can be as small as one file (your app binary) like a golang static binary or it can be as bigkpkjpj as an Ubutu distro with apt, and Apache or PHP. 

**Kernel** 
The kernel is a computer program at the core of a computer's operating system with complete control over everything in the system. It is the "portion of the operating system code that is always resident in memory". It manages the operations of the computer and the hardware, most notably memory and CPU time. It facilitates interactions between hardware and software components. 


### What is the right image?

Go to hub.docker.com and search for the image that you are looking for. There are official ones, which you will most likely use. 

`docker image ls` you will see the images that you have recently used. The tags will let you know which version it is if it's not the latest. 

Best practice is to specify the exact version. 

You will see alpine attached in some versions. Alpine is a very small and light version of linux. 

The image ID is based upon the criptographic sha of each image in docker hub. 

Images are designed using the union file system concept of making layers about the changes. 

`docker history nginx:latest` 
This is a history of the image layers. Every image starts with a blank layer known as scratch. Every set of changes that happen after that is another layer. 

- Images are made up of file system changes and metadata
- Each layer is uniquely identified and only stored once on a host
- This saves storage space on host and transfer time on push/pull
- A container is just a single read/write layer on top of an image 
- `docker image history` and `docker image instpect` commands can teach us what's going on inside an image and how it was made. 


We have to refer to the image by repository, tag, and 
The tag of an image it's like a git tag. It's a pointer to a specific image commit and could be anything inside that repo. 

To tag an image: 
`docker image tag nginx bretfisher/nginx`
The image that I am going to give a new tag to goes first and then the new tag that I want to give it.

`docker image push bretfisher/nginx` uploads changed layers to an image registry (default is Hub)

To push you need to login: `docker login`

To build a dockerfile with a different name than the default with is Dockerfile: `docker build -f some-dockerfile`


ENV 
Environment variables: One reason they were chosen as preferred way to inject key/value is that they work everywhere, on every OS and config. 

RUN commands:
You will see them when you need to install software, or you need to unzip of edit files. Run commands can also run shell scripts and any command that you can access in the file. 

Expose command 
Exposes ports ont he docker virtual network 
You still have to use -p or -P to open/forward these ports on host 

CMD 
required: run this command when container is launched 
Only one CMD allowed, so if there are multiple, last one wins. 

`docker image build -t customnginx .`


Hello 
