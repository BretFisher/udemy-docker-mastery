docker network create -d overlay backend

docker network create -d overlay frontend

docker service create --name vote --replicas 1 -p 8080:80 --network frontend bretfisher/examplevotingapp_vote

docker service create --name redis --replicas 1 --network frontend redis:3.2

docker service create --name worker --replicas 1 --network backend bretfisher/examplevotingapp_worker

# docker service create --name db --replicas 1 --network backend postgres:9.4 -e POSTGRES_HOST_AUTH_METHOD=trust
docker service create --name db --network backend -e POSTGRES_HOST_AUTH_METHOD=trust --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4

docker service create --name result --replicas 1 --network backend --port 5001:80 bretfisher/examplevotingapp_result