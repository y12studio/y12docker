#!/bin/bash
# SWAP_SIZE=512M
SWAP_SIZE="512M"
# read -e -p "SwapSize(M/G) [${SWAP_SIZE}]: " -i "${SWAP_SIZE}" SWAP_SIZE
# CraftThatBlock/SwapUbuntu
# https://github.com/CraftThatBlock/SwapUbuntu
#
# Setup variables
SWAP_PATH="/swapfile"

# Start script
sudo fallocate -l $SWAP_SIZE $SWAP_PATH
sudo chmod 600 $SWAP_PATH && sudo mkswap $SWAP_PATH && sudo swapon $SWAP_PATH
echo "$SWAP_PATH   none    swap    sw    0   0" | sudo tee /etc/fstab -a
#sudo sysctl vm.swappiness=10
echo "vm.swappiness=10" | sudo tee /etc/sysctl.conf -a
#sudo sysctl vm.vfs_cache_pressure=50
echo "vm.vfs_cache_pressure=50" | sudo tee /etc/sysctl.conf -a
# Done
