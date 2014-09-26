FROM y12docker/java8
#
# collectd install
#
RUN apt-get -yq update && apt-get install -y collectd
#
# logstash install
#
# Download version 1.4.2 of logstash
RUN wget -qO- https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz | tar xvz -C /tmp && \
    mv /tmp/logstash-* /opt/logstash
#
# conf inject
#
ENV LS /opt/logstash/bin/logstash
ENV LS_CONF /opt/conf/logstash.conf
ENV LS_SRV /etc/service/logstash/run
ADD logstash.conf $LS_CONF
ADD logstash.sh $LS_SRV
RUN chmod +x $LS_SRV

ENV CTD_CONF /opt/conf/collectd.conf
ENV CTD_SRV /etc/service/collectd/run
ADD collectd.conf $CTD_CONF
ADD collectd.sh $CTD_SRV
RUN chmod +x $CTD_SRV

CMD ["/sbin/my_init"]
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*