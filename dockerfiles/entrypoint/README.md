# Understanding ENTRYPOINT and CMD

Table of Contents

- [Understanding ENTRYPOINT and CMD](#understanding-entrypoint-and-cmd)
  - [Lecture 1: What's an ENTRYPOINT?](#lecture-1-whats-an-entrypoint)
    - [Why would you want this?](#why-would-you-want-this)
    - [Exercise](#exercise)
    - [Summary](#summary)
  - [Lecture 2: USING ENTRYPOINT and CMD in the CLI](#lecture-2-using-entrypoint-and-cmd-in-the-cli)
    - [Exercise](#exercise-1)
    - [4 Rules](#4-rules)
    - [Gotchas](#gotchas)
    - [Exercise 2](#exercise-2)
    - [Summary](#summary-1)
  - [Lecture 3: Using ENTRYPOINT and CMD in Docker Compose](#lecture-3-using-entrypoint-and-cmd-in-docker-compose)
    - [Exercise](#exercise-2)
    - [Summary](#summary-2)
  - [Quiz](#quiz)
  - [Assignment: Build a curl image](#assignment-build-a-curl-image)

## Lecture 1: What's an ENTRYPOINT?

You remember `CMD`. That's the thing the container runs on start. There's also, `ENTRYPOINT`, which can also run things on start, but how are they different?

An `ENTRYPOINT` allows you to configure a container that will run as an executable. You can think of it as a building block where you can stack additional commands too.

Everytime you start a container, docker takes `ENTRYPOINT` and `CMD` and just combines them into one long command with a space between them (e.g. `ENTRYPOINT` + [Space] + `CMD`).

For example, the offical mysql image makes use of an `ENTRYPOINT`:

```dockerfile
FROM debian:buster-slim

# ommitted ...

VOLUME /var/lib/mysql

# Config files
COPY config/ /etc/mysql/
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306 33060
CMD ["mysqld"]
```

<small>[full example](https://github.com/docker-library/mysql/blob/aa600026fe54b1fa6b2a7ac80ffbb466618fcabf/8.0/Dockerfile.debian)</small>

If you were to build and run a container of this image the resulting command would be:

```shell
./docker-entrypoint.sh mysqld
```

i.e., `ENTRYPOINT` + [Space] + `CMD`

### Why would you want this?

Combining `ENTRYPOINT` and `CMD` provides you better flexiblity in creating Dockerfiles for command-line tools and scripts. Simply use an `ENTRYPOINT` as your base foundation, then add additional defaults using a `CMD` statement to build upon the `ENTRYPOINT`. Fortunately, if you want to make modifications to the defaults at runtime, you can override the command without replacing the `ENTRYPOINT`.

Here's another example. The nginx image also uses a `docker-entrypoint.sh` for its `ENTRYPOINT`.

[full example](https://github.com/nginxinc/docker-nginx/blob/2decc81a019b5df087c9162d3621b1c9beb3104f/mainline/debian/Dockerfile)

By default, the image appends a command to the `ENTRYPOINT` which results in nginx running in the foreground. The `ENTRYPOINT` is used to add desired setup before nginx starts, like silencing the logs if an environment variable is set. Applying setup configuration is a great example for where you might want to use an `ENTRYPOINT`.

### Exercise

Let's create a custom image that uses the nginx binary directly as the `ENTRYPOINT` and configure nginx to print its help text with an additional command argument.

[entrypoint-1 example](/dockerfiles/entrypoint-1/Dockerfile)

Setting `ENTRYPOINT` will remove the `CMD` instruction defined in the nginx base image. So keep that in mind, if you need this, the `CMD` instruction must be redefined in the current image.

Build and the image.

```bash
docker build -t testnginx .
docker run --rm testnginx   
```

Output:

```shell
nginx version: nginx/1.21.4
Usage: nginx [-?hvVtTq] [-s signal] [-p prefix]
             [-e filename] [-c filename] [-g directives]

Options:
  -?,-h         : this help
  -v            : show version and exit
  -V            : show version and configure options then exit
  -t            : test configuration and exit
  -T            : test configuration, dump it and exit
  -q            : suppress non-error messages during configuration testing
  -s signal     : send signal to a master process: stop, quit, reopen, reload
  -p prefix     : set prefix path (default: /etc/nginx/)
  -e filename   : set error log file (default: /var/log/nginx/error.log)
  -c filename   : set configuration file (default: /etc/nginx/nginx.conf)
  -g directives : set global directives out of configuration file
```

### Summary

So to recap an `ENTRYPOINT` allows you to configure the default executable for the container which can be extended with additional `CMD` options. Doing so allows you to create custom Dockerfiles for command-line tools and your own scripts. You'll get more practice in future lectures and learn how to modify `ENTRYPOINT` and `CMD` at runtime.

Resources

- <https://docs.docker.com/engine/reference/builder/#entrypoint>
- <https://docs.docker.com/engine/reference/builder/#cmd>

## Lecture 2: USING ENTRYPOINT and CMD in the CLI

You might be wondering if Docker provides a way to modify the `ENTRYPOINT`  without creating a new image? Maybe you want to override the `ENTRYPOINT` at runtime the same way you can override the default `CMD` of an image.

The `docker run` command has an optional `--entrpoint` flag for this. An entrypoint supplied in the command-line will overwrite any `ENTRYPOINT` defined in the Dockerfile.

```shell
docker run --entrypoint IMAGE [command] [ARG...]
```

### Exercise

Let's see an example that modifies both default entrypoint and command. In the previous lecture we saw how we could print nginx help text by creating a custom image. You can do the same thing in the command-line.

Run:

```shell
docker run --rm --entrypoint nginx nginx:1.21.4 -h
```

### 4 Rules

There's 4 rules that describe how `CMD` and `ENTRYPOINT` interact.

4 Rules For `CMD` & `ENTRYPOINT`

1) Dockerfile should specify at least one of the `CMD` or `ENTRYPOINT` commands.
2) `ENTRYPOINT` should be defined when using the container as an executable.
3) `CMD` should be used as a way of defining default arguments for an ENTRYPOINT command or for executing an ad-hoc command in a container.
4) `CMD` will be overridden when running the container with alternative arguments.

### Gotchas

When you combine the `ENTRYPOINT` and the `CMD` [the resulting command may vary](https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact) based on usage of either _shell_ or _exec_ form in the Dockerfile. If you use shell form with `ENTRYPOINT`, any `CMD` or run command-line arguments will be ignored and `ENTRYPOINT` will be started as a subcommand of `/bin/sh -c` which doesn't pass Unix signals like `SIGTERM` from `docker stop <container>`.

### Exercise 2

Let's see a fun example in action.

[entrypoint-2 example](dockerfiles/../entrypoint-2/Dockerfile)

We have a silly bash script that iterates over the lyrics of Rick Astley's "Never gonna give you up". If  `--link` or `-l` flags are passed to the `ENTRYPOINT` the script will print the YouTube link for the song. However, it shouldn't until we modify the Dockerfile because currently the `ENTRYPOINT` is using shell form.

If you inspect the bash script, you'll see it makes use of a `trap`. A `trap` is used to capture most Unix signals when they occur and allows you to execute a command in response. In practice, this is often used to clean up resources before the script exits.

> Note! `trap` cannot capture `SIGKILL` and `SIGSTOP`. [Learn more.](https://stackoverflow.com/questions/58139053/catch-sigstop-with-sigkill-before-gracefully)

The `trap` syntax is:  `trap [command] [signal...]` where one or more signal are separated by a space.

We'll use `trap` to confirm using the `ENTRYPOINT` with shell form prevents Unix signals from being passed to our script. We'll also confirm that `CMD` commands and command-line arugments will be ignored.

Let's run it.

```bash
docker build -t rick .
docker run rick # CMD ["--link"] is ignored 😱
docker run rick -l # command-line arguments are ignored
```

If you try to stop the containers with `docker stop <container>` the trap will not print the shutting down text. This confirms the `SIGTERM` signal is not passed to the script. Also, since the resulting commands never recieve the link flags this confirms the containers are tied to what we declared in the `ENTRYPOINT` using shell form.

```shell
never gonna give you up
never gonna let you down
never gonna run around and desert you
never gonna make you cry
never gonna say goodbye
never gonna tell a lie and hurt you
```

Update the `ENTRYPOINT` in the Dockerfile to use exec form, then rebuild the image and try the commands again. This time the link flags should be appended to the `ENTRYPOINT`. Furthermore, the trap in the script will capture the `SIGTERM` triggered by `docker stop` as expected. Use `docker ps` to grab the container ID.

```bash
docker ps 
docker stop db532d2ef5d6
```

The result:

```shell
YouTube link: https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley
never gonna give you up
never gonna let you down
never gonna run around and desert you
never gonna make you cry
never gonna say goodbye
shutting down
```

### Summary

You're not forced to create a new image to make changes to the entrypoint.
Using the `--entrypoint` flag is an alternate approach while using `docker run`.

Comamand-line arguments will be appended to the end of any `ENTRYPOINT`, unless the `ENTRYPOINT` is using shell form, in which case, all command-line arguments and Unix signals will be ignored by the `ENTRYPOINT`.

Resources

- <https://docs.docker.com/engine/reference/commandline/run/#options>
- <https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact>
- <https://stackoverflow.com/questions/58139053/catch-sigstop-with-sigkill-before-gracefully>

## Lecture 3: Using ENTRYPOINT and CMD in Docker Compose

We've seen how we can use entrypoint and command together in our Dockerfiles and with the `docker run` command, but how does it work with `docker-compose`?

Fortunately, `docker-compose` version 2 and 3 support `entrypoint:` and `command:`.

You can override the default command and entrypoint. List values are also supported by both keys.

```shell
entrypoint: /app/entrypoint.sh 
command: ["command", "--flag"]
```

### Exercise

Let's modify the same example from previous lessons. Imagine you want to inspect the container filesystem of the nginx image.

[entrypoint-3](/dockerfiles)

```shell
docker-compose up
```

Output:

```bash
[+] Running 1/1
 ⠿ Container test-nginx-1  Recreated                                                       0.1s
Attaching to test-nginx-1
test-nginx-1  | total 16
test-nginx-1  | drwxr-xr-x 2 root root 4096 Nov 17 13:20 .
test-nginx-1  | drwxr-xr-x 3 root root 4096 Nov 17 13:20 ..
test-nginx-1  | -rw-r--r-- 1 root root  497 Nov  2 14:49 50x.html
test-nginx-1  | -rw-r--r-- 1 root root  615 Nov  2 14:49 index.html
test-nginx-1 exited with code 0
```

> __! Note__
>
> Using `entrypoint:` overrides both the default `ENTRYPOINT` on the image and removes any default `CMD`.
In other words, if there's a `CMD` instruction in the Dockerfile  __it will be ignored__. So remember to set `command:` if this is not what you want.

### Summary

We can use `entrypoint:` and `command:` in our compose files to overwrite the `ENTRYPOINT` and `CMD` in our Dockerfiles. Remember that `entrypoint:` overrides both the default `ENTRYPOINT` and `CMD` of the image.

Resources

- <https://docs.docker.com/compose/compose-file/compose-file-v3/#entrypoint>
- <https://docs.docker.com/compose/compose-file/compose-file-v3/#command>

---

## Quiz

<br/>

1. __When would you want to use both a CMD and ENTRYPOINT?__

    A) When you want to configure the default executable for the container and extend it with additional command options.

    B) When the `ENTRYPOINT` is being sassy.

    C) When you want to use docker-compose.

    D) When you want to use a shell script.

    <details>
    <summary>See Quiz Answers</summary>
    <br>

     - __Answser: A__

        B) Incorrect. This was joke.

        C) Incorrect. You can override entrypoints and commands in docker cli and docker-compose.

        D) Incorrect. Entrypoints don't have to be shell scripts to take advantage of commands.

    </details>
    <br>

2. __Why does the resulting command vary when combining ENTRYPOINT and CMD?__

    A) `ENTRYPOINT` and `CMD` behavior is unpredictable.

    B) Using _exec form_ and _shell form_ in the same Dockerfile creates varying results.

    C) Using _shell form_ in an `ENTRYPOINT` creates varying results.

    D) Using _exec form_ in an `ENTRYPOINT` creates varying results.

    <details>
    <summary>See Quiz Answers</summary>
    <br>

     - __Answser: C__

        A) Incorrect. There are rules that govern how `ENTRYPOINT` and `CMD` interact.

        B) Incorrect. Using _exec form_ and _shell form_ in the same Dockerfile is not the true cause of variation.

        D) Incorrect. Variation has nothing to do with using _exec form_ in an `ENTRYPOINT`.

    </details>
    <br>

3. __Which of the following statements are true?__

    A) Using `entrypoint`: in a compose file requires the image to have `ENTRYPOINT` declared.

    B) Using `entrypoint:` in a compose file requires you to also set `command:`.

    C) `entrypoint:` in a compose file _only_ overwrites the `ENTRYPOINT` in the image.

    D) `entrypoint:` in a compose file overwrites the `ENTRYPOINT` and `CMD` in the image.

    <details>
    <summary>See Quiz Answers</summary>
    <br>

     - __Answser: D__

        A) Incorrect. Using `entrypoint`: does not require the image to have `ENTRYPOINT` declared.

        B) Incorrect. Using `entrypoint:` does not require you to also set `command:`.

        C) Incorrect. `entrypoint:` overwrites the `ENTRYPOINT` and the `CMD` in the image.

    </details>
    <br>

---

## Assignment: Build a curl image

[see assignment-1](/dockerfiles/entrypoint-assignment-1)
