#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install openssh-server net-tools ansible git

mkdir ~/.ssh
ssh-keygen -q -f ~/.ssh/id_rsa -N ""
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys

printf "\n\n"
printf "You need to enable passwordless sudo, see README.md"
printf "\n\n"

mkdir ~/Workspace
git clone https://github.com/KMK-ONLINE/workstation.git ~/Workspace/
