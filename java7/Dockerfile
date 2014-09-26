FROM y12docker/pbase

RUN apt-get -yq update
RUN apt-get install -yq openjdk-7-jre-headless

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/

CMD ["/sbin/my_init"]
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*