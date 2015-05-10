FROM wordpress:4.2.2
ADD mpm_event.conf mpm_prefork.conf mpm_worker.conf /etc/apache2/mods-available/
#
# install wp-cli
#
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
ADD wpinstall.sh /wpinstall.sh
RUN chmod +x /wpinstall.sh
