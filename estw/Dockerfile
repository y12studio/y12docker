FROM y12docker/elasticsearch

RUN /opt/elasticsearch/bin/plugin -u http://maven.ansj.org/org/ansj/elasticsearch-analysis-ansj/1.x.1/elasticsearch-analysis-ansj-1.x.1-release.zip -i ansj
RUN apt-get install -y opencc

ADD . /opt/estw
RUN cd /opt/elasticsearch/config &&  cat /opt/estw/ansj_plug.conf >> elasticsearch.yml
RUN chown elk:elk -R /opt/elasticsearch

EXPOSE 8080 9200

CMD ["/sbin/my_init"]
RUN rm -rf /tmp/* /var/tmp/*