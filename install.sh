#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install openssh-server git python python-pip

mkdir ~/.ssh
ssh-keygen -q -f ~/.ssh/id_rsa -N ""
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys

printf "\n\n"
printf "You need to enable passwordless sudo, see:"
printf "\thttps://github.com/KMK-Online/workstation/#enable-sudo-password-less"
printf "\n\n"

mkdir -p ~/Workspace/workstation

if grep -q 18.04 /etc/lsb-release
then
  git clone -b 'ubuntu-18.04' git://github.com/KMK-ONLINE/workstation.git ~/Workspace/workstation
else
  git clone git://github.com/KMK-ONLINE/workstation.git ~/Workspace/workstation
fi

sudo pip install -U ansible
