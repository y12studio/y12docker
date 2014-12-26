FROM y12docker/java8:14.12
# http://www.glowstone.net/
ENV GS_VER 109
ENV APP_DIR /opt/gs
RUN mkdir $APP_DIR && \
    curl "http://ci.chrisgward.com/job/Glowstone/$GS_VER/artifact/build/libs/glowstone.jar" -o $APP_DIR/glowstone.jar

ENV GS_SRV /etc/service/gs/run
ADD gs.sh $GS_SRV
RUN chmod +x $GS_SRV
EXPOSE 25565

WORKDIR $APP_DIR
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm -rf /tmp/* /var/tmp/*
