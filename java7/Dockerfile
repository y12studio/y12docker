FROM phusion/baseimage:0.9.13
MAINTAINER Y12STUDIO <y12studio@gmail.com>

RUN locale-gen --no-purge zh_TW.UTF-8
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8
RUN update-locale
ENV DEBIAN_FRONTEND noninteractive

# Use the phusion baseimage's insecure key
RUN /usr/sbin/enable_insecure_key

RUN apt-get -yq update
RUN apt-get -yq upgrade
RUN apt-get install -yq curl wget git python
RUN apt-get install -yq openjdk-7-jre-headless

ENV JAVA_HOME  /usr/lib/jvm/java-7-openjdk-amd64/

CMD ["/sbin/my_init"]
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*