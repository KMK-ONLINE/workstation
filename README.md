# Moving from OSX to Ubuntu for realzies

## Pre-Tasks

    sh -c "$(wget -qO - https://raw.githubusercontent.com/KMK-Online/workstation/master/install.sh)"

### Enable sudo password less:

    sudo visudo

    # modify this line:
    %sudo ALL=(ALL:ALL) ALL
    # change to:
    %sudo ALL=(ALL:ALL) NOPASSWD:ALL

### Enable ssh key login

    sudo vi /etc/ssh/sshd_config

    # uncomment this line:
    AuthorizedKeysFile %h/.ssh/authorized_keys

### You're ready to provisioning with

    ansible-galaxy install -r ~/Workspace/workstation/requirements.yml
    ansible-playbook -i 127.0.0.1, ~/Workspace/workstation/workstation.yml -vvvv


#### Misc ToDo:

    [ ] Workstation machine locking automatically
    [ ] Check Garuda's setup Ubuntu setup script, should use workstation
_
# Psych!!! We still use macs after all!!

## Requirements
  If you remote provisioning macs with mac, be sure to use ansible with python 3

    ansible-galaxy install -r ~/Workspace/workstation/requirements-mac.yml
    ansible-playbook -i $REMOTE, -e target_host='all' Workspace/workstation/test-engineering-mac.yml -v --ask-become-pass
