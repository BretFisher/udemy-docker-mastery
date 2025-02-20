# Swarm App Lifecycle

## Using Secrets With Local Docker Compose

docker node ls

docker-compose up -d

docker-compose exec psql cat /run/secrets/psql_user

docker-compose 11

pcat docker-compose.yml

## Full App Lifecycle: Dev, Build and Deploy With a Single Compose Design

docker-compose up -d

docker inspect TAB COMPLETION

docker-compose down

docker-compose -f docker-compose.yml -f docker-compose.test.yml up -d

docker inspect TAB COMPLETION

docker-compose -f docker-compose.yml -f docker-compose.prod.yml config --help

docker-compose -f docker-compose.yml -f docker-compose.prod.yml config

docker-compose -f docker-compose.yml -f docker-compose.prod.yml config > output.yml

## Service Updates: Changing Things In Flight

docker service create -p 8088:80 --name web nginx:1.13.7

docker service ls

docker service scale web=5

docker service update --image nginx:1.13.6 web

docker service update --publish-rm 8088 --publish-add 9090:80

docker service update --force web

## Healthchecks in Dockerfiles

docker container run --name p1 -d postgres

docker container ls

docker container run --name p2 -d --health-cmd="pg_isready -U postgres || exit 1" postgres

docker container ls

docker container inspect p2

docker service create --name p1 postgres

docker service create --name p2 --health-cmd="pg_isready -U postgres || exit 1" postgres
