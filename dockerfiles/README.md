# Dockerfile Next Steps 
Table of Contents

[Understanding ENTRYPOINT and CMD](#entrypoint-and-cmd)

## Understanding ENTRYPOINT and CMD

### What's an ENTRYPOINT? What's a CMD? 

#### ENTRYPOINT 

An `ENTRYPOINT` allows you to configure a container that will run as an executable. 

There are _two_ forms: the _exec form_ and the _shell form_.

__SYNTAX__

```Dockerfile
ENTRYPOINT ["executable", "param1", "param2"] # execform
```    

```Dockerfile
ENTRYPOINT command param1 param2 # shellform
```

When you run a container, any command line arguments will be appended to the entrypoint.

This feature allows us to create images with a default executable in mind or change the default entrypoint of a base image.

For example, the default entrypoint for the offical nginx image is `ENTRYPOINT ["/docker-entrypoint.sh"]` [1](https://github.com/nginxinc/docker-nginx/blob/2decc81a019b5df087c9162d3621b1c9beb3104f/mainline/debian/Dockerfile). We can override this to print the contents of the container filesystem instead.

```Dockerfile
FROM nginx:1.21.4
ENTRYPOINT ["ls"]
```
#### CMD 

`CMD` provides defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case the executable is the entrypoint.

There are _three_ forms:

__SYNTAX__

```Dockerfile
CMD ["executable","param1","param2"] # execform
```

```Dockerfile
CMD ["param1","param2"] # parameter-only form 
```

```Dockerfile
CMD command param1 param2 # shellform 
```

__NOTE:__ If you omit the executable, you must have an ENTRYPOINT defined in the Dockerfile. 

Using the same custom nginx image, this is how it would look like using CMD.

```dockerfile
FROM nginx:1.21.4
CMD ["ls"]
```
Now you might be wondering, if we can use CMD in the same way as ENTRYPOINT why does Docker need both? The truth is, they compliment each other. ENTRYPOINT and CMD are often used together. When a command is present, it's appended to the end of the entrypoint.

For example:

```dockerfile
FROM nginx:1.21.4
ENTRYPOINT ["ls"]
CMD ["-l"]
# becomes "ls -l"
```
    
#### Summary

Both ENTRYPOINT and CMD provide increased flexibility in how we write Dockerfiles. They allow us to provide good defaults in our images, with the option to change this behavior at runtime.

### Lecture 1: ENTRYPOINT

In this lecture, we will discuss ENTRYPOINT.

### Exercise

In this exercise...

Exercise Files

- [/dockerfiles/entrypoint-1](/dockerfiles/entrypoint-1)

Resources

- https://docs.docker.com/engine/reference/builder/#entrypoint

### Lecture 2: CMD

In this lecture, we will discuss CMD.

### Exercise

In this exercise...

Exercise Files

- [/dockerfiles/command-1](/dockerfiles/command-1)

Resources

- https://docs.docker.com/engine/reference/builder/#cmd

### Lecture 3: OVERRIDING ENTRYPOINT and CMD in the CLI

In this lecture, we will discuss command line properties.

```
--entrypoint		Overwrite the default ENTRYPOINT of the image
```

You can overwrite the command at the command line as well.

### Exercise

In this exercise...

Exercise Files

- [/dockerfiles/entrypoint-2](/dockerfiles/entrypoint-2)
- [/dockerfiles/command-2](/dockerfiles/command-2)

Resources
- https://docs.docker.com/engine/reference/commandline/run/#options (--entrypoint)


### Lecture 4: Using ENTRYPOINT and CMD in Docker Compose

In this lecture, we will discuss compose properties.

```
entrypoint: ["php", "-d", "memory_limit=-1", "vendor/bin/phpunit"]
```

```
command: ["bundle", "exec", "thin", "-p", "3000"]
```

### Exercise

In this exercise...

Exercise Files

- [/dockerfiles/entrypoint-3](/dockerfiles/entrypoint-3)
- [/dockerfiles/command-3](/dockerfiles/command-3)

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