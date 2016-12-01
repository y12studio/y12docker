FROM y12docker/kotlin-gradle:3.2.1
# ENV CORDA_VERSION M6.0
RUN apk add --no-cache git
RUN git clone --depth=1 https://github.com/corda/corda /corda
WORKDIR /corda
