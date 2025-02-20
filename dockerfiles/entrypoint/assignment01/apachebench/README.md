# ENTRYPOINT Assignment 01 Part 2 - ApacheBench

> Create an image for the ApacheBench HTTP server benchmarking tool

This Dockerfile Assignment will create a container image for the ApacheBench HTTP server benchmarking tool. This is a simple tool that can be used to test the performance of a web server by sending a large number of requests to it and measuring the response time.

We'll use the Ubuntu image with the apt-get package manager.

## Requirements

- No source code is needed, so we won't need to COPY any files into the image.
- Use the `ubuntu` image as the base image. You could pin to a specific version (LTS versions end in .04, so `:20.04`), or use `:latest`.
- Use the `apt-get` package manager to install the `apache2-utils` package, which contains the `ab` ApacheBench tool.
- Create an ENTRYPOINT that runs the `ab` command.
- Create an CMD that gives some default arguments to the `ab` command. For example, `-n 10 -c 2 https://www.bretfisher.com/`. `-n 10` means 10 requests total, and `-c 2` means 2 concurrent requests.
- OR, an easer way for tools like ab, curl, httping, that always need a URL added at the CLI, I find it easier to add some default arguments to the ENTRYPOINT, and leave the CMD as `["--help"]` so that all the user needs to do is add the URL at the end of the `docker run` command. If they forget to override the CMD, they'll get the help output.

## Tips

- Tip: Ubuntu Linux uses the `apt` package manager. It requires a three step process (commands) with 1. update the db cache, 2. install packages, 3. cleanup the cache files. You can chain these three commands together with &&, so a typical install would look like `apt-get update && apt-get install -y <list-of-packages> && rm -rf /var/lib/apt/lists/*` and you can add line breaks for readability with a backslash `\` at the end of the Dockerfile line.
- ApacheBench expects a URL as the last argument, so you'll need to pass that in when you run the container, and it always needs http:// or https:// in the URL, and a trailing slash after the domain name.
- Tip: As most Linux CLI tools, ab has a --help option, so I welcome you to explore the options and customize the CMD instruction to your liking. Remember you could always build this image, then overwride the ENTRYPOINT at runtime and then play around with ab by running `docker run -it --entrypoint sh <image-name>`

