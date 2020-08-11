FROM ubuntu:18.04

#MAINTANER Your Name "youremail@domain.tld"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev python3.5

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
