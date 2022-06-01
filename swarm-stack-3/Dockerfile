FROM drupal:9.3.13


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# this next part was corrected to be more clear on how you'd typically 
# customize your own theme. first you need to clone the theme into this repo
# with something like downloading the lastest theme for bootstrap
# https://www.drupal.org/project/bootstrap and extract into themes dir on host.
# then you'll COPY it into image here:

WORKDIR /var/www/html/core

COPY ./themes ./themes

WORKDIR /var/www/html
