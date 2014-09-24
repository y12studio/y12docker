FROM y12docker/logstash
MAINTAINER Y12STUDIO <y12studio@gmail.com>

# add our user and group first
RUN groupadd -r elk && useradd -r -g elk elk

#
# Install ElasticSearch.
#
RUN wget -qO- https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.tar.gz | tar xvz -C /tmp &&\
    mv /tmp/elasticsearch-* /opt/elasticsearch && chown elk:elk /opt/elasticsearch

ENV ES_SRV /etc/service/elasticsearch/run
ADD elasticsearch.sh $ES_SRV
RUN chmod +x $ES_SRV


#
# Install kibana
#
RUN wget -qO- https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz | tar xvz -C /tmp &&\
    mv /tmp/kibana-* /opt/kibana && chown www-data:www-data /opt/kibana
#
# Install nginx
#
RUN apt-get -yq update && apt-get install -yq nginx
ENV NGINX_SRV /etc/service/nginx/run
ADD nginx.sh $NGINX_SRV
RUN chmod +x $NGINX_SRV
ADD nginx.conf /etc/nginx/nginx.conf
# 
# Update logstash conf
#
ADD nginx.pattern /opt/logstash/patterns/nginx
ADD logstash.conf $LS_CONF
#
# update kibana default route schema json file
#
# RUN cd /opt/kibana/app/dashboards && cp default.json default.json.bak
# ADD kibana.json /opt/kibana/app/dashboards/default.json

#
# enable elasticsearch plugin
#
RUN /opt/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ

CMD ["/sbin/my_init"]
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*