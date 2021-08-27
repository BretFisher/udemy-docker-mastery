# use this empty Dockerfile to build your assignment

FROM node:6-alpine
# Required nodejs

EXPOSE 3000
# Expose port required in assignment

RUN apk add --update tini \
    && mkdir -p "/usr/src/app"
# Install alpine package
# Create app working directory

WORKDIR "/usr/src/app"
# Change working directory

COPY . .
# Copy all files

RUN npm install \
    && npm cache clean --force
# Install node dependencies

CMD ["/sbin/tini", "--", "node", "./bin/www"]
# Run app
