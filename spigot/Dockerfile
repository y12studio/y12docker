FROM y12docker/java8:14.12
# https://github.com/y12studio/y12docker/
# Install spigot

ENV APP_DIR /opt/spigot

RUN git config --global user.email "spigot@example.com"
RUN git config --global user.name "spigot"

WORKDIR $APP_DIR

RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
  java -jar BuildTools.jar && \
  rm -rf /root/.m2 && \
  find * -maxdepth 0 ! -name '*.jar' -exec rm -rf {} \;

RUN echo "eula=true" > $APP_DIR/eula.txt
ADD server.properties $APP_DIR/

ENV MC_SRV /etc/service/spigot/run
ADD spigot.sh $MC_SRV
RUN chmod +x $MC_SRV
EXPOSE 25565

# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm -rf /tmp/* /var/tmp/*
