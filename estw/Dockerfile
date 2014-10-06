FROM y12docker/elasticsearch

RUN wget -qO- http://maven.ansj.org/org/ansj/elasticsearch-analysis-ansj/1.x.1/elasticsearch-analysis-ansj-1.x.1-release.zip  -O /tmp/es-ansj.zip
RUN apt-get install -y opencc

RUN unzip -d /tmp /tmp/es-ansj.zip &&\
    cd /tmp && mv elasticsearch-analysis-ansj-* /opt/elasticsearch/plugins/ansj
    
ADD utils/requirements.txt /opt/estw/utils/
#
# Test only
#
RUN cd /opt/estw/utils && pip install -r requirements.txt

ADD . /opt/estw
#
# dic 
# [BYVoid/OpenCC](https://github.com/BYVoid/OpenCC)
# 
RUN cd /opt/elasticsearch/plugins/ansj/dic/user/ &&\
    mv default.dic /tmp/default.dic && opencc -i /tmp/default.dic -o default.dic

RUN mv -f /opt/estw/dic/ext.dic /opt/elasticsearch/plugins/ansj/dic/user/

RUN cd /opt/elasticsearch/config &&  cat /opt/estw/ansj_plug.conf >> elasticsearch.yml
RUN chown elk:elk -R /opt/elasticsearch

EXPOSE 8080 9200

CMD ["/sbin/my_init"]
RUN rm -rf /tmp/* /var/tmp/*