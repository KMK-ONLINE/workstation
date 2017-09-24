#! /usr/bin/env bash

ansible-galaxy install --role-file=requirements.yml
ansible-playbook "$@" --inventory-file=127.0.0.1, --verbose laptop.yml
