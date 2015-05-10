FROM alpine:3.1
RUN apk add --update bash curl openssl && rm -rf /var/cache/apk/*
ADD alias.sh docker-compose.yml host_install.sh /dcfiles/
ADD wp /dcfiles/wp
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD cat /dcfiles/host_install.sh
