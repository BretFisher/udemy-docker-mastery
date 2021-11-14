# Dockerfile Next Steps 
Table of Contents

[Understanding ENTRYPOINT and CMD](#entrypoint-and-cmd)

## Understanding ENTRYPOINT and CMD

- What
    - Entrypoints are ...
    - Commands are ...
- Why
    - Both are often used together (they compliment each other).
- How
    
    __SYNTAX__
    ```Dockerfile
    ENTRYPOINT ./main
    CMD ["--my-flag", "1" ] # --my-flag 1
    ```


### Lecture 1: Something interesting

In this lecture, we will discuss ENTRYPOINT.

### Exercise

In this exercise...

Exercise Files

- [/dockerfiles/entrypoint-1](/dockerfiles/entrypoint-1)

Resources

- https://docs.docker.com/engine/reference/builder/#entrypoint

### Lecture 2: Something else

In this lecture, we will discuss CMD.

### Exercise

In this exercise...

Exercise Files

- [/dockerfiles/command-1](/dockerfiles/command-1)

Resources

- https://docs.docker.com/engine/reference/builder/#cmd

### Lecture 3: One more thing

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


### Lecture 4: One more thing

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

3. Select the correct way to day X?

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

[/dockerfiles/entrypoint-command-assignment-1](/dockerfiles/entrypoint-command-assignment-1)