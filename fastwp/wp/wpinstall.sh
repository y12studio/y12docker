#!/bin/bash
WP_URL=http://${1}
WP_TITLE=Y12NVWM
WP_PLUGINS=${2}
echo wp host : ${WP_URL}
echo plugin : ${WP_PLUGINS}
#
# wp-admin password
#
openssl rand -base64 6 | tr -d '+=/' > /user.txt
openssl rand -base64 15 | tr -d '+=/' > /pass.txt
WP_USER=$(cat /user.txt)
WP_PASS=$(cat /pass.txt)
wp core install --allow-root --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_USER}" --admin_password="${WP_PASS}" --admin_email="user@example.org"
wp core language install zh_TW --allow-root --activate
#
for name in ${WP_PLUGINS}
do
    wp plugin install ${name} --activate --allow-root
done
#
wp theme install minamaze --allow-root
wp core update --allow-root
chown -R www-data:www-data /var/www/html
echo ""
echo "=========================================================="
echo "wp-admin user : ${WP_USER}"
echo "wp-admin password : ${WP_PASS}"
echo "=========================================================="
echo ""
