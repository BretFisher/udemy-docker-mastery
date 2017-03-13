# Assignment: Compose For On-The-Fly Image Building and Multi-Container Testing

Goal: You aren't doing development yet, you just want to test Drupal locally with a custom theme installed.

- Use the compose file you created in the last assignment (drupal and postgres) as a starting point.
- You won't need any volumes for the drupal service, as we'll be building a custom image with theme inside it.
- You WILL need a volume for postgres to keep your data across Compose restarts (see below).

## Dockerfile
- First you need to build a custom Dockerfile in this directory, `FROM drupal:8.2`
- Then RUN apt package manager command to install git: `apt-get update && apt-get install -y git`
- Remember to cleanup after your apt install with `rm -rf /var/lib/apt/lists/*` and use `\` and `&&` properly. You can find examples of them in drupal official image. More on this below under Compose file.
- Then change `WORKDIR /var/www/html/themes`
- Then use git to clone the theme with: `RUN git clone --branch 8.x-3.x --single-branch --depth 1 https://git.drupal.org/project/bootstrap.git`
- Combine that line with this line, as we need to change permissions on files and don't want to use another image layer to do that (it creates size bloat). This dupal container runs as www-data user but the build actually runs as root, so often we have to do things like `chown` to change file owners to the proper user: `chown -R www-data:www-data bootstrap`. Remember the fist line needs a `\` at end to signify the next line is included in the command, and at start of next line you should have `&&` to signify "if first command succeeds then also run this command"
- Then just to be save, change the working directory back to it's default (from drupal image) at `/var/www/html`

## Compose File
- We're going to build a custom image in this compose file for drupal service.
- Rename image to `custom-drupal` as we want to make our own image from the official `drupal`.
- We want to build the default Dockerfile by adding `build: .` to `drupal` service. When we add a build + image value to a compose service, it knows to use the image name to write to in our image cache, rather then pull from Docker Hub.
- for `postgres` service, you need the same password as in previous assignment, but also add a volume for `drupal-data:/var/lib/postgresql/data` to your drupal configuration will persist across Compose restarts.

## Start Containers, Configure Drupal
- Start containers like before, configure Drupal web install like before.
- After website comes up, click on `Appearance` in top bar, and notice a new theme called `Bootstrap` is there.
- Click Install and set as default. Then click "Back to site" (in top left) and the webiste interface should look different. You've successfully installed and activated a new theme in your own custom image without installing anything on your host other then Docker!
