# use the README.md file for requirements to build this image
# If you get stuck, the answer/ directory has the solution
FROM ubuntu:latest

RUN apt-get update && \
	apt-get install -y apache2-utils && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["ab"]

CMD ["-n", "10", "-c", "2", "https://www.bretfisher.com/"]

