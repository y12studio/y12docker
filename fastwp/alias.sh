DCP=fastwp
alias dc='docker-compose -p ${DCP}'
alias wp2run='dc run --no-deps wordpress'
alias wp2sh='docker exec -t ${DCP}_wordpress_1'
alias dcup='dc stop && dc rm && dc build && dc up -d'
function wpinstall(){ wp2sh /wpinstall.sh $1 "$(cat $2)"; }
alias wp='wp2sh wp --allow-root'
alias wpinfo='wp core version --extra && wp user list && wp plugin list && wp theme list'
