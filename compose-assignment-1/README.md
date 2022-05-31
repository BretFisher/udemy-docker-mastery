# Assignment: Writing a Compose File

> Goal: Create a compose config for a local Drupal CMS website

- This empty directory is where you should create a docker-compose.yml
- Use the `drupal:9.3.13` image along with the `postgres:14.3` image
- 2020 UPDATE: No version needed in compose files! All 2.x and 3.x features supported without version key.
- Use `ports` to expose Drupal on 8080
- Be sure to setup POSTGRES_PASSWORD on postgres image
- Walkthrough Drupal config in browser at `http://localhost:8080`
- Tip: Drupal assumes DB is localhost, but it will actually be on the compose service name you give it
- Use Docker Hub documentation to figure out the right environment and volume settings
- Extra Credit: Use volumes to store Drupal unique data
