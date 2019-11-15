#! /usr/bin/env bash

ANSIBLE_VAULT_PASSWORD_FILE='./ansible_password'

if [[ -f $ANSIBLE_VAULT_PASSWORD_FILE ]]; then
    ansible-playbook -i hosts provision.yml --ask-become-pass --tags "${TAGS}" "$1" "$2"
else
	echo "There should exist a password file: ansible_password"
fi
