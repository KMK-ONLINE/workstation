#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install git openssh-server

mkdir ~/.ssh
ssh-keygen -q -f ~/.ssh/id_rsa -N ""
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys

printf "\n\n"
printf "You need to enable passwordless sudo, see:"
printf "\thttps://github.com/KMK-Online/workstation/#enable-sudo-password-less"
printf "\n\n"

mkdir -p ~/Workspace/workstation
git clone git://github.com/KMK-ONLINE/workstation.git ~/Workspace/workstation

sudo pip install -U ansible

