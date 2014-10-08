FROM y12docker/java8
MAINTAINER Y12STUDIO <y12studio@gmail.com>

# add our user and group first
RUN groupadd -r elk && useradd -r -g elk elk
RUN apt-get install -yq nginx

#
# Install ElasticSearch.
#
RUN wget -qO- https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.tar.gz | tar xvz -C /tmp &&\
    mv /tmp/elasticsearch-* /opt/elasticsearch
#
# Install kibana
#
RUN wget -qO- https://download.elasticsearch.org/kibana/kibana/kibana-3.1.1.tar.gz | tar xvz -C /tmp &&\
    mv /tmp/kibana-* /opt/kibana && chown www-data:www-data /opt/kibana
#
# enable elasticsearch plugin
#
RUN /opt/elasticsearch/bin/plugin -install mobz/elasticsearch-head
RUN /opt/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ

#
# Test only
#
ADD utils/requirements.txt /opt/esbuild/utils/
RUN cd /opt/esbuild/utils && pip install -r requirements.txt

ADD . /opt/esbuild

ENV ES_SRV /etc/service/elasticsearch/run
ADD elasticsearch.sh $ES_SRV
RUN chmod +x $ES_SRV
#
# conf nginx
#
ENV NGINX_SRV /etc/service/nginx/run
ADD nginx.sh $NGINX_SRV
RUN chmod +x $NGINX_SRV
ADD nginx.conf /etc/nginx/nginx.conf
#
# update kibana default route schema json file
#
# RUN cd /opt/kibana/app/dashboards && cp default.json default.json.bak
# ADD kibana.json /opt/kibana/app/dashboards/default.json

RUN sed -i 's/":9200"/":8080"/' /opt/kibana/config.js

RUN chown elk:elk -R /opt/elasticsearch

EXPOSE 8080 9200

CMD ["/sbin/my_init"]
# Disable ssh
# RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm -rf /tmp/* /var/tmp/*