FROM y12docker/ab:150513
ADD alias.sh docker-compose.yml /dc/
ADD cron /dc/cron
ADD abe /dc/abe
ADD nginx /dc/nginx
ENV PDIR pbnet
CMD /dc/setup.sh
