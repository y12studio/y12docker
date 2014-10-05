FROM y12docker/java8

RUN cd /opt/java8/script/logstash && bash install.sh -i

EXPOSE 25826

CMD ["/sbin/my_init"]