#!/bin/sh
set -e

# seed the mounted volume with the default images from /app/data-default if it's empty
# Docker will actually auto-copy any files in the image in /app/data to a freshly mounted volume
# but this doesn't work in other Container runtimes and can be confusing to use,
# so we'll just do it manually here

if [ -z "$(ls -A /app/data)" ]; then
    cp -r /app/data-default/* /app/data/
fi

# If /run/secrets/ exists, turn any mounted secrets found into environment variables
# NOTE: this is not used for this Python app, but it's a good example of how to do it

if [ -d "/run/secrets" ]; then
    for secret in /run/secrets/*; do
        if [ -f "$secret" ]; then
            # Get just the filename without the path
            name=$(basename "$secret")
            # Read contents and set as env var
            export "$name"="$(cat $secret)"
        fi
    done
fi

# use envsubst to replace any environment variables in the config file
# NOTE: this is not used for this Python app, but it's a good example of how to do it with envsubst

if [ -f "/app/data/config.json" ]; then
    envsubst < /app/data/config.json > /app/data/config.json.tmp
    mv /app/data/config.json.tmp /app/data/config.json
fi

# if $PORT is not set, quit with an error
# NOTE: this is not used for this Python app, but it's a good example of how to do it

# if [ -z "$PORT" ] ; then
#     echo "ERROR: PORT must be set"
#     exit 1
# fi

# run the app by passing execution to the Dockerfile CMD
exec "$@"
