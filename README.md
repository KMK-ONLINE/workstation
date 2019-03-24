# Ubuntu

**Warning**
- We have merged Ubuntu **18.04** specific changes into master, if you're provisioning Ubuntu 16.04, checkout the branch `ubuntu-16.04`
- In `install.sh`, we changed ansible to be installed via official ppa. Be sure to uninstall ansible if you previously installed it with pip. Also, pip installed with apt will be removed by `dhellmann.python-dev`

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

    ./all.sh workstation.yml

Which expands to:

    ansible-galaxy install -r ~/Workspace/workstation/requirements.yml
    ansible-playbook -i 127.0.0.1, ~/Workspace/workstation/workstation.yml -vvvv

If you are provisioning a laptop you will want to add:

    ./all.sh tommy.yml --extra-vars "laptop=true"

#### Misc ToDo:

    [ ] configure /etc/ansible/ansible.cfg
        change the default callback, you can only have one 'stdout' type  enabled at a time.
        stdout_callback = debug
    [ ] Standard KMK projects need: `pip3 install peru`
    [ ] Selenium runner needs: `openjdk-11-jre-headless`
    [ ] Security needs: openvpn, opensc, gnupg2, scdaemon, pcscd, rng-tools, pinentry-curses, pinentry-gnome3
    [ ] Workstation machine locking automatically
    [ ] Check Garuda's setup Ubuntu setup script, should use workstation

# Mac OS

## Requirements
  If you remote provisioning macs with mac, be sure to use ansible with python 3. We have geerlingguy.homebrew role, so it should brew/cask/etc installation in macs.

      ansible-galaxy install -r requirements.yml

## Provision from another machine
    ansible-playbook -i $REMOTE, -e remote_user=$USER test-engineering-mac.yml -v --ask-become-pass

**Notes**
- We cant automate xcode with mas-cli because of: https://github.com/mas-cli/mas/issues/164
- Should you have error on installing `fbsimctl`, do `rm -rf  ~/Library/Caches/org.carthage.CarthageKit`
- Should java download keeps failing, try install it manually:
  - `brew tap homebrew/cask-versions` if you haven't tapped
  - `brew cask install java10`
