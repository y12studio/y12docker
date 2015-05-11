FROM alpine:3.1
RUN apk add --update bash curl openssl && rm -rf /var/cache/apk/*
ADD alias.sh docker-compose.yml post.sh /dcfiles/
ADD wp /dcfiles/wp
ADD setup.sh /setup.sh
RUN chmod +x /setup.sh
RUN chmod +x /dcfiles/post.sh
CMD /setup.sh
