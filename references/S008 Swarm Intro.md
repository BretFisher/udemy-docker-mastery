# Swarm Intro and Creating a 3-Node Swarm Cluster

## Create Your First Service and Scale it Locally

docker info

docker swarm init

docker node ls

docker node --help

docker swarm --help

docker service --help

docker service create alpine ping 8.8.8.8

docker service ls

docker service ps frosty_newton

docker container ls

docker service update TAB COMPLETION --replicas 3

docker service ls

docker service ps frosty_newton

docker update --help

docker service update --help

docker container ls

docker container rm -f frosty_newton.1.TAB COMPLETION

docker service ls

docker service ps frosty_newton

docker service rm frosty_newton

docker service ls

docker container ls

## Creating a 3-Node Swarm Cluster

http://play-with-docker.com

docker info

docker-machine

docker-machine create node1

docker-machine ssh node1

docker-machine env node1

docker info

http://get.docker.com

docker swarm init

docker swarm init --advertise-addr TAB COMPLETION

docker node ls

docker node update --role manager node2

docker node ls

docker swarm join-token manager

docker node ls

docker service create --replicas 3 alpine ping 8.8.8.8

docker service ls

docker node ps

docker node ps node2

docker service ps sleepy_brown

## Scaling Out with Overlay Networking

docker network create --driver overlay mydrupal

docker network ls

docker service create --name psql --netowrk mydrupal -e POSTGRES_PASSWORD=mypass postgres

docker service ls

docker service ps psql

docker container logs psql TAB COMPLETION

docker service create --name drupal --network mydrupal -p 80:80 drupal

docker service ls

watch docker service ls

docker service ps drupal

docker service inspect drupal
