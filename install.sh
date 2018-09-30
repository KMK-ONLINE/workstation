#!/usr/bin/env bash

sudo apt update
sudo apt --yes install openssh-server git python python-pip

mkdir -p ~/.ssh
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -q -f ~/.ssh/id_rsa -N ""
fi

if [ ! -f ~/.ssh/authorized_keys ] || ! grep -q "$(cat ~/.ssh/id_rsa.pub)" ~/.ssh/authorized_keys ; then
  cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
fi

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

sudo -H pip install -U ansible
