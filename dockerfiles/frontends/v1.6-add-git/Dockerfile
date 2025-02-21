# syntax=docker/dockerfile:1.6
# ADD can now clone git repos without git installed
# https://docs.docker.com/engine/reference/builder/#adding-a-git-repository-add-git-ref-dir

#######
# EXAMPLE 1
#######
FROM alpine as clone-public-repo

# clone public git repo
# also keep the .git directory, which is off by default
ADD --keep-git-dir=true https://github.com/moby/buildkit.git#v0.10.1 /buildkit

#######
# EXAMPLE 2
#######
FROM alpine as clone-private-repo

# clone private git repo
# This assumes you have a ssh key that's needed to access the private repo
# use `docker build --ssh default .` to pass the ssh-agent keys
ADD git@github.com:BretFisher/autodeploy.git /autodeploy