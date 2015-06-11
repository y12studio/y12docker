DCP=peanet
alias dc='docker-compose -p ${DCP}'
alias dcup='dc stop && dc rm && dc build && dc up -d'
alias alice2sh='docker exec -i -t ${DCP}_alice_1'
alias bob2sh='docker exec -i -t ${DCP}_bob_1'
alias alice='alice2sh alpha-cli -conf=/btc/bitcoin.conf -rpcport=18332 -regtest=1 -testnet=0'
alias bob='bob2sh alpha-cli -conf=/btc/bitcoin.conf -rpcport=18332 -regtest=1 -testnet=0'
