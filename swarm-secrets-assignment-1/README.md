# Assignment: Create a Stack with Secrets

> Goal: Create and use a Swarm Secret in an existing Compose file.

[Docker Mastery Lecture](https://www.udemy.com/course/docker-mastery/learn/lecture/6796822)
[Docker Swarm Mastery Lecture](https://www.udemy.com/course/docker-swarm-mastery/learn/practice/28073)

We are starting with a `docker-compose.yml` in the same directory as this README.md file. It was used previously for local Compose CLI, and we now want to make it work in Swarm with Secrets.

## Compose File

- Since we're using Swarm, we need to update `version:` at the top to the latest 3.x version (3.9).
- Change the Drupal image to use the official version we've tested: `drupal:9.3.13`, and remove any build options (since Swarm can't build an image).
- For the `postgres:14.3` service, you'll need to set a password. This time we want it to use the password stored in the Swarm Secret, which Swarm will mount on the file system for us inside the Postgres container. See the Postgres Docker Hub page to find out more about the POSTGRES_PASSWORD_FILE environment variable.
- Add an external secret and tell the postgres service to mount it.

## Docker Swarm

- Manually create the secret with the `docker secret create` command, and name it the same you set in the compose file.
- Deploy the stack file, and verify that Drupal can start the web install with the password you set in Swarm Secrets.
