FROM alpine:3.1
WORKDIR /app
RUN apk add --update bash python py-pip curl openssl ca-certificates drill\
     && rm -rf /var/cache/apk/*
RUN pip install requests nose
