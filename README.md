# Moving from OSX to Ubuntu for realzies

## Pre-Tasks

    `sudo apt-get update`
    `sudo apt-get upgrade`
    `sudo apt-get install git openssh-server ansible`

### setup ssh

    `mkdir ~/.ssh`
    `ssh-keygen ~/.ssh`
    `cat id_rsa.pub >> authorized_keys`
    # add key to github


### Enable sudo password less:

    `sudo visudo`

    # modify this line:
    `%sudo ALL=(ALL:ALL) ALL`
    # change to:
    `%sudo ALL=(ALL:ALL) NOPASSWD:ALL`

    # Enable ssh key login
    `sudo vi /etc/ssh/sshd_config`

    # uncomment this line:
    `AuthorizedKeysFile %h/.ssh/authorized_keys`

### Run this provisioning repo

    `mkdir ~/Workspace`
    `cd Workspace`
    `git clone git@github.com:sillylogger/workstation.git`
    `sudo chown `whoami`:`whoami` -R /etc/ansible/`
    `ansible-galaxy -r requirements.yml`
    `ansible-playbook -i 192.168.0.11, workstation/laptop.yml -vvvv`

### Stuff I need to fix / install

- clipboard buffer?
- backups?
- window management?
- mail client -- Nylas Mail?
- mouse & touchpad, natural scrolling
- git config global

### :-(

- onepassword
- evernote
- slow wifi?!

    $ sudo vi /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
    # powersave 3 => 2?

    $ dmesg
    $ watch -n1 iwconfig

    # missing firmware 5, maybe just try loading 4 as 5 for the time being.. better than not loading any?
    $ sudo cp /lib/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin /lib/firmware/ath10k/QCA6174/hw3.0/firmware-5.bin


### ideal partition.. couldn't install this way because my copy of windows is shite

    partition       name                 file system   mount point  size      flags
    /dev/nvme0n1p1  EFI System Parition  fat32         /boot/efi    512mb     boot, esp
    /dev/nvme0n1p2                       ext4          /            366.21gb
    /dev/nvme0n1p3                       linux-swap                 17.58gb
    /dev/nvme0n1p4                       fat32                      92.55gb   msftdata


