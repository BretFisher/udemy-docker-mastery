# Why does Docker exist?

> Nav: [Back to Intro Lectures](../README.md)

Now that you know the basics of what Docker is, you might be thinking that this sounds like a lot of work to re-package software just so we can run it a different way. Obviously we all were building, distributing, and running software before Docker came along, so "Why Docker, and Why Now?".

> Docker *needed* to exist because the old ways were full of friction and complexity when met with the modern area of software development and the speed at which we needed to operate in ever-growing teams.

## The Problem of Speed

Every major shift in computing has been about speed. Not the speed of CPUs or networks directly, but about increasing the speed of delivering ideas to users. By combining the ideas of the image, registry, and container, Docker affects the speed of nearly every part of the software lifecycle:

- Develop faster
- Build faster
- Test faster
- Deploy faster
- Update faster
- Recover faster

> This is it. Containers are the next once-in-a-decade shift in infrastructure and process that can make or break you. --Bret Fisher 😎

## The Problem of N+1 Environments

Have you ever heard of the [Works on My Machine](https://blog.codinghorror.com/the-works-on-my-machine-certification-program/) (WOMM) problem?

![WOMM Badge](images/codinghorror-works-on-my-machine.png)

(WOMM Badge Copyright: [Jeff Atwood](https://codinghorror.com/))

"Works on My Machine" is a satirical name for "I've *only* tested on my machine".

The idea of WOMM is that you can't just write or run software that works on your machine. We need to design software that works on other machines. Today, that means it needs to work across all the developers, operators, and testers machines. Then it also needs to work the same in automated testing environments, and multiple server environments.

The problem of environments in our increasingly de-centralized and distrubuted world is that we can't predict the exact environment our software will run on.

> How ever many environments you're managing today (N), tomorrow it'll likely be N+1. --Bret Fisher 😎

Combine that with the proliferation of software languages and dependency managers, and any single "app" is likely the combination of multiple languages, dependency installers, and configuration types.  The web frontend might be React (JavaScript), the backend written in PHP, while a job processor is written in Python.

Docker's founder Solomon Hykes called this "Matrix from Hell", and it's more common then ever.
