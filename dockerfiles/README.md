# Dockerfile Next Steps 
Table of Contents

[Understanding ENTRYPOINT and CMD](#entrypoint-and-cmd)

## Understanding ENTRYPOINT and CMD

### Lecture 1: What's an ENTRYPOINT?

You remember `CMD`. That's the thing the container runs on start. There's also, `ENTRYPOINT`, which can also run things on start, but how do they work together?

Everytime you start a container, docker takes `ENTRYPOINT` and `CMD` and just combines them into one long command with a space between them. 

![](/docs/images/entrypoint-cmd.png)

### Why would you want this?

Combining `ENTRYPOINT` and `CMD` allows you to create Dockerfiles for cli tools and scripts. For example, the default `ENTRYPOINT` for the offical nginx image is a script:

```dockerfile
ENTRYPOINT ["/docker-entrypoint.sh"]

# https://bit.ly/3FXw00f
```
You can create a custom Dockerfile that uses the nginx binary directly. This might be useful if you want to use the cli tool with your own default options using `CMD`. Here's an example, we can replace the default `ENTRYPOINT` and configure nginx to print its help text.

```dockerfile
FROM nginx:1.21.4
ENTRYPOINT ["nginx"]
CMD ["-h"]
# becomes "nginx -h"
```

Let's run it.
```bash
docker build -t testnginx . # build image
docker run --rm testnginx   # start container
```

Output:
```
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

#### Summary

So to recap an `ENTRYPOINT` allows you to configure the default executable for the container which can be extended with additional `CMD` options. Doing so allows you to create custom Dockerfiles for cli tools and your own scripts. You'll get more practice in future lectures and learn how to modify ENTRYPOINT and CMD at runtime.

Resources

- https://docs.docker.com/engine/reference/builder/#entrypoint
- https://docs.docker.com/engine/reference/builder/#cmd

### Lecture 2: USING ENTRYPOINT and CMD in the CLI

In this lecture, we will discuss command line properties.

Resources
- https://docs.docker.com/engine/reference/commandline/run/#options (--entrypoint)


### Lecture 3: Using ENTRYPOINT and CMD in Docker Compose

In this lecture, we will discuss compose properties.

Resources
- https://docs.docker.com/compose/compose-file/compose-file-v3/#entrypoint
- https://docs.docker.com/compose/compose-file/compose-file-v3/#command


<hr/>

<details>
<summary>Quiz</summary>

<br/>

1. When would you want to use both a command and entrypoint?

    A)
    
    B)

    C) 

    D) 

2. Which of the following statements are true?

    A)
    
    B)

    C) 

    D) 

3. Select the correct way to do X?

    A)
    
    B)

    C) 

    D) 

<br>

<details>
<summary>See Quiz Answers</summary>
<br>

- Q1: __A__
- Q2: __C__
- Q3: __D__
</details>
</details>
<hr/>

### Assignment 1: Build a curl image

For this assignment, your task is to...

Assignment Files

[/dockerfiles/entrypoint-command-assignment-1](/dockerfiles/entrypoint-cmd-assignment-1)