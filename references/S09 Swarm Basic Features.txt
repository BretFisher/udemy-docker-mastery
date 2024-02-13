# Swarm Basic Features and How to Use Them In Your Workflow

## Scaling Out with Overlay Networking

docker network create --driver overlay mydrupal

docker network ls

docker service create --name psql --network mydrupal -e POSTGRES_PASSWORD=mypass postgres

docker service ls

docker service ps psql

docker container logs psql TAB COMPLETION

docker service create --name drupal --network mydrupal -p 80:80 drupal

docker service ls

watch docker service ls

docker service ps drupal

docker service inspect drupal

## Scaling Out with Routing Mesh

docker service create --name search --replicas 3 -p 9200:9200 elasticsearch:2

docker service ps search

## Assignment Answers: Create a Multi-Service Multi-Node Web App

docker node ls

docker service ls

docker network create -d overlay backend

docker network create -d overlay frontend

docker service create --name vote -p 80:80 --network frontend -- replica 2 COPY IMAGE

docker service create --name redis --network frontend --replica 1 redis:3.2

docker service create --name worker --network frontend --network backend COPY IMAGE

docker service create --name db --network backend COPY MOUNT INFO

docker service create --name result --network backend -p 5001:80 COPY INFO

docker service ls

docker service ps result

docker service ps redis

docker service ps db

docker service ps vote

docker service ps worker

cat /etc/docker/

docker service logs worker

docker service ps worker

## Swarm Stacks and Production Grade Compose

docker stack deploy -c example-voting-app-stack.yml voteapp

docker stack

docker stack ls

docker stack ps voteapp

docker container ls

docker stack services voteapp

docker stack ps voteapp

docker network ls

docker stack deploy -c example-voting-app-stack.yml voteapp

## Using Secrets in Swarm Services

docker secret create psql_usr psql_usr.txt

echo "myDBpassWORD" | docker secret create psql_pass - TAB COMPLETION

docker secret ls

docker secret inspect psql_usr

docker service create --name psql --secret psql_user --secret psql_pass -e POSTGRES_PASSWORD_FILE=/run/secrets/psql_pass -e POSTGRES_USER_FILE=/run/secrets/psql_user postgres

docker service ps psql

docker exec -it psql.1.CONTAINER NAME bash

docker logs TAB COMPLETION

docker service ps psql

docker service update --secret-rm

## Using Secrets with Swarm Stacks

vim docker-compose.yml

docker stack deploy -c docker-compose.yml mydb

docker secret ls

docker stack rm mydb

## Assignment Answers: Create A Stack with Secrets and Deploy

vim docker-compose.yml

docker stack deploy - c docker-compose.yml drupal

echo STRING |docker secret create psql-ps - VALUE

docker stack deploy -c docker-compose.yml drupal

docker stack ps drupal
