# ENTRYPOINT Assignment 01 Part 1 - cmatrix

> Bulding a Matrix screensaver as a Docker Image

While this is just a fun tool, it's a good way to practice creating a Docker image for a single binary.

All we need to get started is the latest alpine image and a quick understanding of the apk package manager.

## Requirements for this Dockerfile

- No source code is needed, so we won't need to COPY any files into the image.
- Start FROM the `alpine` image. You can also practice pinning to a recent version (found on Docker Hub's alpine image page.) or `:latest`. I tend to care less about FROM image pinning for CLI tools like this.
- Use the `apk` package manager to install the `cmatrix` package.
- You'll want to set the ENTRYPOINT to run `cmatrix` when the container starts.
- Let's make this image easy to run by adding a `CMD` instruction with some default cmatrix arguments. For example, `-abs -C red`.
- The cmatrix tool needs a terminal to run, so you need to ensure docker provisions a tty. Always use the `-it` flags with this image when running the container, or you'll get a "Error opening terminal" error.

## Tips

- Tip: Alpine Linux uses the `apk` package manager, not `apt` or `yum`. The command to install a package is `apk add <package>`.
- Tip: Use the `--no-cache` apk flag to avoid caching the package index locally, so a command would look like `apk add --no-cache <package>`.
- Tip: As most Linux CLI tools, cmatrix has a --help option, so I welcome you to explore the options and customize the CMD instruction to your liking. Remember you could always build this image, then overwride the ENTRYPOINT at runtime and then play around with cmatrix by running `docker run -it --entrypoint sh <image-name>`

