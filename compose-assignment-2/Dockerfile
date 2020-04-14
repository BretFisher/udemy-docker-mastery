# create your custom drupal image here, based of official drupal
FROM drupal:8.8.2

# install Git
RUN apt-get update && apt-get install -y git
RUN rm -rf /var/lib/apt/lists/*

# download Bootstrap themes into themes folder
WORKDIR /var/www/html/themes

# clone Drupal repo and set permissions
RUN git clone --branch 8.x-3.x --single-branch --depth 1 https://git.drupal.org/project/bootstrap.git
RUN chown -R www-data:www-data bootstrap

# point back to HTML folder
WORKDIR /var/www/html
