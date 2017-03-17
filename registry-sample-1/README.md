# Commands for setting up a local registry


- enable insecure registries in Daemon




- Enable SSL
mkdir -p certs 
openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt

docker run --rm -e COMMON_NAME=127.0.0.1 -e KEY_NAME=registry -v $(pwd)/certs:/certs centurylink/openssl