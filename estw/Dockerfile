FROM y12docker/elasticsearch

RUN wget -qO- http://maven.ansj.org/org/ansj/elasticsearch-analysis-ansj/1.x.1/elasticsearch-analysis-ansj-1.x.1-release.zip  -O /tmp/es-ansj.zip
RUN apt-get install -y opencc

RUN unzip -d /tmp /tmp/es-ansj.zip &&\
    cd /tmp/elasticsearch-analysis-ansj-* &&\
    mkdir -p /opt/elasticsearch/plugins/ansj &&\
    mv lib/*.jar /opt/elasticsearch/plugins/ansj &&\
    mv dic /opt/elasticsearch/config/


ADD utils/requirements.txt /opt/estw/utils/
#
# Test only
#
RUN cd /opt/estw/utils && pip install -r requirements.txt

ADD . /opt/estw
RUN cd /opt/elasticsearch/config &&  cat /opt/estw/ansj_plug.conf >> elasticsearch.yml
RUN chown elk:elk -R /opt/elasticsearch

EXPOSE 8080 9200

CMD ["/sbin/my_init"]
RUN rm -rf /tmp/* /var/tmp/*