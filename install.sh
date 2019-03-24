#!/usr/bin/env bash

sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt -qq update
sudo apt -qq --yes install software-properties-common ansible openssh-server git

printf "\n\n"

mkdir -p ~/.ssh
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -q -f ~/.ssh/id_rsa -N ""
else
  printf "already have ~/.ssh/id_rsa\n"
fi

if [ ! -f ~/.ssh/authorized_keys ] || ! grep -q "$(cat ~/.ssh/id_rsa.pub)" ~/.ssh/authorized_keys ; then
  cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
else
  printf "already have ~/.ssh/authorized_keys\n"
fi

printf "\n\n"
printf "You need to enable passwordless sudo, see:\n"
printf "\thttps://github.com/KMK-Online/workstation/#enable-sudo-password-less"
printf "\n\n"

mkdir -p ~/Workspace/workstation
git clone git://github.com/KMK-ONLINE/workstation.git ~/Workspace/workstation
