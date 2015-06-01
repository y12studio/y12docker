FROM nginx:1.9.0
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
ADD www /data/www
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
