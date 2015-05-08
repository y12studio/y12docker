DCP=dv2
alias dc='docker-compose -p ${DCP}'
alias wp2sh='docker exec -i -t ${DCP}_wordpress_1'
alias varnish2sh='docker exec -i -t ${DCP}_varnish_1'
alias dcup='dc stop && dc rm && dc build && dc up -d'
