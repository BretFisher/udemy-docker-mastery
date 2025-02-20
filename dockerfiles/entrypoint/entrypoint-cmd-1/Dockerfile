FROM ubuntu:latest

RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["curl"]

CMD ["--help"]
