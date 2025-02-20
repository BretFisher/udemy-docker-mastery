# Dockerfile ENTRYPOINT

> Shell commands and reference links, per lecture

## Lecture 1: Review before ENTRYPOINT

- [Docs: Dockerfile reference](https://docs.docker.com/reference/dockerfile/)

## Lecture 2: Buildtime vs. Runtime

### Key Takeaways

- Buildtime statements affect the files in the image or how the image is built.
- Runtime statements are typically stored as metadata and affect the container.
- Some statements affect how the image is built and also change container start behavior
- Overwrite statements replace any previous use.
- Additive statements add to any previous use.
- Know your base (FROM) images. Many statement types affect downstream images.
- Understanding these effects helps troubleshoot Dockerfile and container issues.

## Lecture 3: What's an ENTRYPOINT?

### Resources

- [Docs: ENTRYPOINT](https://docs.docker.com/reference/dockerfile/#entrypoint)

### Files/Repos used

- [dockerfiles/entrypoint/entrypoint-1](https://github.com/BretFisher/udemy-docker-mastery/tree/main/dockerfiles/entrypoint/entrypoint-1)

### Key Takeaways

- ENTRYPOINT executes a command on container start.
- ENTRYPOINT is a **Runtime** statement, stored as metadata with an image.
- Only the last ENTRYPOINT in a Dockerfile is used, making it an **Overwrite** type.
- A container needs at least a CMD or an ENTRYPOINT to know how to start.
- ENTRYPOINT requires more typing to overwrite compared to CMD, so it's rarely used by itself as a replacement for CMD.
- You can overwrite ENTRYPOINT with `docker run --entrypoint "something" <image>`.

### Commands

```shell
docker run busybox
docker inspect busybox
docker run -it busybox
  whoami
  ps
  ls /bin
  hostname
  date
  exit
docker build -t hostname .
docker run hostname
docker run hostname date
docker build -t entryhostname .
docker run entryhostname
docker run entryhostname date
docker inspect entryhostname
docker run --help
docker run --entrypoint date entryhostname
```

## Lecture 4: Using ENTRYPOINT and CMD together

### Resources

- [MySQL Docker Hub Image](https://hub.docker.com/_/mysql)
- [SIGINT, SIGTERM, and SIGKIL](https://eitca.org/cybersecurity/eitc-is-lsa-linux-system-administration/linux-processes/process-signals/examination-review-process-signals/explain-the-difference-between-sigint-sigterm-and-sigkill-signals-in-linux/)
- [PIDs in Linux and Unix](https://en.wikipedia.org/wiki/Process_identifier)
- [Docker Blog: Choosing between RUN, CMD, and ENTRYPOINT](https://www.docker.com/blog/docker-best-practices-choosing-between-run-cmd-and-entrypoint/)

### Files/Repos used

- [dockerfiles/entrypoint/entrypoint-cmd-1](https://github.com/BretFisher/udemy-docker-mastery/tree/main/dockerfiles/entrypoint/entrypoint-cmd-1)
- [dockerfiles/entrypoint/entrypoint-cmd-2](https://github.com/BretFisher/udemy-docker-mastery/tree/main/dockerfiles/entrypoint/entrypoint-cmd-2)
- [httping-docker](https://github.com/bretfisher/httping-docker)

### Key Takeaways

- If both ENTRYPOINT and CMD are set, they combine into a single command on container start.
- For CLI tools, use ENTRYPOINT to set the base executable, while CMD should provide default arguments.
- CMD can be easily overridden at docker run without replacing the ENTRYPOINT.
- For pre-launch scripts, ENTRYPOINT should set the script, and CMD should set the final process.
- ENTRYPOINT shell scripts should use exec “$@” to pass execution (PID 1) to the CMD.

### Commands

```shell
docker run --name myshell -it mysql sh
docker top myshell
```

## Lecture 5: Shell and Exec forms

### Resources

- [(Docs) Shell and Exec Form](https://docs.docker.com/reference/dockerfile/#shell-and-exec-form)
- [(Docs) How CMD and ENTRYPOINT](https://docs.docker.com/reference/dockerfile/#understand-how-cmd-and-entrypoint-interact)
- [(Docs) The SHELL statement](https://docs.docker.com/reference/dockerfile/#shell)
- [(Docs) ENTRYPOINT Examples](https://docs.docker.com/reference/dockerfile/#entrypoint)
- [Crazy ENTRYPOINT, CMD, and SHELL examples](https://dev.to/rimelek/constructing-commands-to-run-in-docker-containers-2g2i)

### Key Takeways

- The RUN, ENTRYPOINT, and CMD instructions can be specified in shell form or exec form.
- Shell form will inject `/bin/sh -c` at the beginning of the command.
- Overwrite the shell that Docker injects with the SHELL statement, e.g. `SHELL ["/bin/bash", "-c"]`
- Shell form is needed for variable substitution, chaining commands, piping output, I/O redirection.
- Exec form (JSON syntax) runs the command without a shell.
- Exec form ensures ENTRYPOINT/CMD binary is PID 1 and receives signals.
- Exec form still passes ENVs from Dockerfile to processes started with ENTRYPOINT, CMD, and RUN.
- Don’t mix forms between ENTRYPOINT and CMD, or [weird things happen](https://docs.docker.com/reference/dockerfile/#understand-how-cmd-and-entrypoint-interact).
- General advice for which form to use:
    - RUN: Use Shell by default.
    - ENTRYPOINT: Always Exec, or CMD can’t be used.
    - CMD: Use Exec by default, but sometimes Shell Form is needed for shell features.
    - ENTRYPOINT + CMD: Always use Exec to avoid [weird edge cases](https://docs.docker.com/reference/dockerfile/#understand-how-cmd-and-entrypoint-interact).

## Assignment 01: Creating CLI tools with ENTRYPOINT

### Resources

### Files/Repos used

- [dockerfiles/entrypoint/assignment01](https://github.com/BretFisher/udemy-docker-mastery/tree/main/dockerfiles/entrypoint/assignment01)

## Assignment 02: Adding startup scripts with ENTRYPOINT

### Resources

### Files/Repos used

- [dockerfiles/entrypoint/assignment02](https://github.com/BretFisher/udemy-docker-mastery/tree/main/dockerfiles/entrypoint/assignment02)

