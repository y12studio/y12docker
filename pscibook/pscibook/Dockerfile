FROM alpine:edge
RUN echo "http://nl.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update bash python py-pip curl openssl ca-certificates drill build-base python-dev && \
    apk add py-zmq py-scipy py-numpy-dev py-matplotlib py-nose py-requests && \
    pip install ipython[notebook] pandas plotly mpld3 && \
    apk del build-base python-dev py-numpy-dev && \
    rm -rf /var/cache/apk/*

WORKDIR /notebooks
ADD *.ipynb *.py /notebooks/example/

# You can mount your own SSL certs as necessary here
ENV PEM_FILE /key.pem
# $PASSWORD will get `unset` within notebook.sh, turned into an IPython style hash
ENV PASSWORD Dont make this your default
ENV USE_HTTP 0

ADD notebook.sh /
RUN chmod u+x /notebook.sh

CMD ["/notebook.sh"]
