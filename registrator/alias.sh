alias dc='docker-compose'
alias web2sh='docker exec -i -t registrator_web2_1 bash'
alias web1sh='docker exec -i -t registrator_web1_1 bash'
alias dcup='dc stop && dc rm && dc build && dc up -d && dc logs'
