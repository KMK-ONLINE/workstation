#! /usr/bin/env bash

# TODO: if argument length < 1 echo usage
# echo "usage: ./all.sh base.yml"

ansible-galaxy install --role-file=requirements.yml  # --force to upgrade occasionally
ansible-playbook ${*:2} --inventory-file=127.0.0.1, -vv $1

