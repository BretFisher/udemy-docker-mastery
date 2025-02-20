# ENTRYPOINT Assignment 02

> Running startup scripts with ENTRYPOINT

This assignment has you building a Dockerfile from scratch to perform startup tasks with an ENTRYPOINT script. This script will perform a few actions before starting the FastAPI Python web API server.

## Dockerfile Requirements

- This is a Python app, so you should start with the `python:slim` image. I always prefer slim images when available, as the default language images are usually too big and bloated for real-world use.
- Set the working directory to `/app`.
- Python apps often keep their dependencies in a requirements.txt file, so let's copy that in first, so we can install dependencies before we copy all the other files in.
- Install the dependencies with a run command for `pip install --no-cache-dir -r requirements.txt`
- Now let's copy all files in after requirements are installed.
- This app requires persistant data, so lets create a volume statment for `/app/data`.
- Set the entrypoint to run the startup script `./docker-entrypoint.sh`.
- Set the cmd to start the uvicorn web server with `uvicorn main:app --host 0.0.0.0 --port 8000`.

## Testing the Image

- Once this image builds, you can run it with a `-p 8000:8000` to make the web server available on http://localhost:8000
- The most interesting URL for testing is the built-in docs of FastAPI at http://localhost:8000/docs
- Python pip has a `--no-cache-dir` option to avoid caching the package index locally, so a command would look like `pip install --no-cache-dir -r requirements.txt`.
- Checkout the `docker-entrypoint.sh` script for the startup tasks. It's a simple script that checks several common things like ensuring the `/app/data` directory exists and copying over any initial data files (which you might want to peak at, 😎).
