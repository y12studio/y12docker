DCP=pbnet011
alias dc='docker-compose -p ${DCP}'
alias dcup='dc stop && dc rm && dc build && dc up -d'
alias alice2sh='docker exec -i -t ${DCP}_alice_1'
alias bob2sh='docker exec -i -t ${DCP}_bob_1'
alias carol2sh='docker exec -i -t ${DCP}_carol_1'
alias alice='alice2sh bitcoin-cli -conf=/btc/bitcoin.conf -regtest'
alias bob='bob2sh bitcoin-cli -conf=/btc/bitcoin.conf -regtest'
alias carol='carol2sh bitcoin-cli -conf=/btc/bitcoin.conf -regtest'
