FROM ubuntu:latest
RUN mkdir /app
COPY config.txt /app/config.txt
COPY private.key /app/private.key
COPY pub.key /app/pub.key
RUN apt-get update
RUN apt-get install -y netcat curl
