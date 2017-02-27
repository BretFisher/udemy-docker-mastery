# use this empty Dockerfile to build your assignment

# This dir contains a Node.js app, you need to get it running in a container
# No modifications to the app should be necessary, only edit this Dockerfile

# Goals of this assignment
# - you should use the latest 6.x version of the official 'node' image on Docker Hub
# - this app listens on port 3000, but the container should launch on port 80
#   so it will respond to http://localhost:80 on your computer
# - create nnew directory /usr/src/app for app source files with 'RUN mkdir -p /usr/src/app'
# - then it needs to first copy in package.json file
# - then it needs to run 'npm install' to install dependencies from that file
# - to keep it clean and small, run 'npm cache clean' after above
# - then it needs to copy in the rest of the files
# - then it needs to start container with command 'node ./bin/www'
# - in the end you should be using FROM, RUN, WORKDIR, COPY, EXPOSE, and CMD commands

FROM node:6-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json package.json
RUN npm install && npm cache clean
COPY . .
EXPOSE 3000
CMD [ "node", "./bin/www" ]

# docker build -t bretfisher/dockerfile-assignment-1 . && docker container run --rm -p 80:3000 -p 5858:5858 -p 9229:9229 bretfisher/dockerfile-assignment-1