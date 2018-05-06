# Disappointed to see that the 18.04 installer no longer offers the option to encrypt the home directory...
# https://askubuntu.com/questions/1029249/how-to-encrypt-home-on-ubuntu-18-04

Login as root

    sudo apt install ecryptfs-utils cryptsetup

    sudo ecryptfs-migrate-home -u <user>

Then logout and login into the encrypted users account – before a reboot! to complete the encryption process

    ecryptfs-unwrap-passphrase

