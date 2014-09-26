FROM y12docker/java8

RUN apt-get -yq update
RUN apt-get install -yq build-essential
#
# install maven
#
ENV MAVEN_VERSION 3.2.3
ENV M2_HOME /opt/maven
ENV M2 $M2_HOME/bin

RUN wget -qO- http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz  | tar xvz -C /tmp && \
    mv /tmp/apache-maven-* $M2_HOME && \
    chmod +x $M2/mvn

#
# install gradle 
#
ENV GRADLE_VERSION 2.1
ENV GRADLE_HOME /opt/gradle
RUN wget -qO- https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip  -O /tmp/gradle.zip && \
    unzip -d /tmp /tmp/gradle.zip &&\
    mv /tmp/gradle-* $GRADLE_HOME

ENV PATH $PATH:$JAVA_HOME/bin:$M2:$GRADLE_HOME/bin
#
# Install Node.js
# 
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc


#
# install protobuf
#
ENV PBUF_VER 2.6.0

RUN wget -qO- https://protobuf.googlecode.com/svn/rc/protobuf-${PBUF_VER}.tar.gz  | tar xvz -C /tmp && \
    cd /tmp/protobuf-* &&\
    ./configure && \
    make && \
    make install && \
    export LD_LIBRARY_PATH=/lib:/usr/local/lib && \
    ldconfig

#
# install grunt
#
RUN npm install -g grunt-cli

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*