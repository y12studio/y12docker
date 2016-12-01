FROM supermina999/alpine-kotlin:latest

RUN mkdir /usr/lib/gradle /app

ENV GRADLE_VERSION 3.2.1
ENV GRADLE_HOME /usr/lib/gradle/gradle-${GRADLE_VERSION}
ENV PATH ${PATH}:${GRADLE_HOME}/bin

WORKDIR /usr/lib/gradle
RUN set -x \
  && apk add --no-cache wget \
  && wget --no-check-certificate https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  && unzip gradle-${GRADLE_VERSION}-bin.zip \
  && rm gradle-${GRADLE_VERSION}-bin.zip

RUN apk update && apk add bash libstdc++ && rm -rf /var/cache/apk/*
