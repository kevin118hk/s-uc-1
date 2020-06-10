FROM alpine:3.7
RUN mkdir /app
COPY config.txt /app/config.txt
COPY private.key /app/private.key
RUN apk update
RUN apk add curl
RUN apk add netcat-openbsd
RUN apk add --update nginx && touch /build-2.0 && mkdir -p /run/nginx && touch /index.html
COPY activesupport-4.2.1.gem /
COPY utils.js /
COPY default.conf /etc/nginx/conf.d/
CMD ["nginx", "-g", "daemon off;"]
