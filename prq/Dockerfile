FROM y12docker/pbase

#
# redis
#
RUN groupadd -r redis && useradd -r -g redis redis

ENV REDIS_VERSION 2.8.13
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-2.8.13.tar.gz
ENV REDIS_DOWNLOAD_SHA1 a72925a35849eb2d38a1ea076a3db82072d4ee43
ENV BUILD_DEP gcc libc6-dev make python-dev

RUN apt-get update && apt-get install -y $BUILD_DEP --no-install-recommends
RUN mkdir -p /usr/src/redis \
	&& curl -sSL "$REDIS_DOWNLOAD_URL" -o redis.tar.gz \
	&& echo "$REDIS_DOWNLOAD_SHA1 *redis.tar.gz" | sha1sum -c - \
	&& tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
	&& rm redis.tar.gz \
	&& make -C /usr/src/redis \
	&& make -C /usr/src/redis install \
	&& rm -r /usr/src/redis

RUN mkdir /data && chown redis:redis /data
VOLUME /data

ENV REDIS_SRV /etc/service/redis/run
ADD script/redis.sh $REDIS_SRV 
RUN chmod +x $REDIS_SRV
ADD script/redis.conf /etc/redis/redis.conf
#
# rq
#
ENV PRQ_SRV /etc/service/prq/run
ADD script/prq.sh $PRQ_SRV
RUN chmod +x $PRQ_SRV

ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
ADD . /app
WORKDIR /app
RUN chown redis:redis /app

CMD ["/sbin/my_init"]

#RUN	apt-get purge -y $BUILD_DEP && apt-get autoremove -y
#RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*