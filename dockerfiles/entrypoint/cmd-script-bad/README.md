# bad example of using a script to start a containerized app

This simple golang web server might need some pre-launch checks, so it requires a startup script.

ENTRYPOINT + CMD is a great choice for this setup.

The point to be made here is that I've seen multiple alternate setups where the final "long running app" starts inside the script or is started in a less-ideal way. This directory shows an example of how NOT to use a startup script for a container.

