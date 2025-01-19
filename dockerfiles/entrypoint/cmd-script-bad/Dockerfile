FROM golang:1.23

WORKDIR /app

EXPOSE 3000

# install dependencies
COPY go.mod go.sum ./
RUN go mod download && go mod verify

# copy the source code and build
COPY . .
RUN go build -v -o webserver .

# be sure we've got the right permissions
RUN chmod +x startup.sh

# BAD IDEA
# Run a script which will do things and then run the webserver
CMD ["./startup.sh"]
