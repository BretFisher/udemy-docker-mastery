FROM ubuntu

# Install the necessary packages
RUN apt-get update && apt-get install -y \
	apache2-utils \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["ab", "-n", "10", "-c", "2"]

CMD ["https://www.bretfisher.com/"]

