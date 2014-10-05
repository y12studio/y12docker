FROM y12docker/elasticsearch

RUN cd /opt/java8/script/logstash && bash install.sh -i

# 
# Update logstash conf
#
ADD nginx.pattern /opt/logstash/patterns/nginx
ADD logstash.conf /opt/conf/logstash.conf

EXPOSE 25826 8080 9200

CMD ["/sbin/my_init"]
# Disable ssh
# RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm -rf /tmp/* /var/tmp/*