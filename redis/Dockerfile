FROM y12docker/logstash

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r redis && useradd -r -g redis redis

ENV REDIS_VERSION 2.8.13
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-2.8.13.tar.gz
ENV REDIS_DOWNLOAD_SHA1 a72925a35849eb2d38a1ea076a3db82072d4ee43

RUN buildDeps='gcc libc6-dev make'; \
	set -x; \
	apt-get update && apt-get install -y $buildDeps curl --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /usr/src/redis \
	&& curl -sSL "$REDIS_DOWNLOAD_URL" -o redis.tar.gz \
	&& echo "$REDIS_DOWNLOAD_SHA1 *redis.tar.gz" | sha1sum -c - \
	&& tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
	&& rm redis.tar.gz \
	&& make -C /usr/src/redis \
	&& make -C /usr/src/redis install \
	&& rm -r /usr/src/redis \
	&& apt-get purge -y $buildDeps curl \
	&& apt-get autoremove -y

RUN mkdir /data && chown redis:redis /data
RUN mkdir /opt/home && chown redis:redis /opt/home
VOLUME /data
WORKDIR /data

ENV REDIS_SRV /etc/service/redis/run

ADD redis.sh $REDIS_SRV
RUN chmod +x $REDIS_SRV
ADD redis.conf /etc/redis/redis.conf

# 
# Update logstash conf
#
ADD logstash.conf $LS_CONF

EXPOSE 6379
CMD ["/sbin/my_init"]
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# USER redis