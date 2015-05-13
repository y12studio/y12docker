FROM alpine:3.1
RUN apk add --update bash curl openssl && rm -rf /var/cache/apk/*
WORKDIR /app
ENV PDIR ab
ADD post.sh setup.sh /dc/
ADD sh/u1404 /dc/absh
RUN chmod +x /dc/*.sh
