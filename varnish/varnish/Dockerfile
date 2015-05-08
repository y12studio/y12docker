FROM ubuntu:14.04.2
RUN apt-get update
RUN apt-get install -y apt-transport-https curl
RUN curl "https://repo.varnish-cache.org/ubuntu/GPG-key.txt" | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list
RUN apt-get update
RUN apt-get install -y varnish
ADD default.vcl /etc/varnish/default.vcl
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
