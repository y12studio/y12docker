FROM y12docker/java8:14.12
# https://github.com/y12studio/y12docker/tree/master/mc
# Install minecraftforge
ENV MCF_VER 1.8-11.14.0.1278-1.8
RUN mkdir /opt/mcf && \
    curl "http://files.minecraftforge.net/maven/net/minecraftforge/forge/$MCF_VER/forge-$MCF_VER-installer.jar" -o /opt/mcf/installer.jar
RUN cd /opt/mcf && \
    java -jar installer.jar --installServer && \
    mv forge-$MCF_VER-universal.jar mcf_server.jar && rm installer.jar
RUN echo "eula=true" > /opt/mcf/eula.txt
ADD server.properties /opt/mcf/

ENV MCF_SRV /etc/service/mcf/run
ADD mcf.sh $MCF_SRV
RUN chmod +x $MCF_SRV
EXPOSE 25565

WORKDIR /opt/mcf
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm -rf /tmp/* /var/tmp/*
