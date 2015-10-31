#! /usr/bin/env bash

set -e

BITBUCKET_GIT_HOST="bitbucket.org"
KNOWN_HOSTS_FILE="/home/vagrant/.ssh/known_hosts"
SSH_CONFIG_FILE="/home/vagrant/.ssh/config"
SSH_KEY_FILE_NAME="taskmanager-vagrant.rsa"
SSH_KEY_DEST="/home/vagrant/.ssh/$SSH_KEY_FILE_NAME"

SSH_KEY="/vagrant/ssh/$SSH_KEY_FILE_NAME"
SSH_CONFIG="/vagrant/ssh/config"



setup_bitbucket() {

  #TODO: Refatory this
  if [[ -f "$KNOWN_HOSTS_FILE" ]]; then
    echo "Bitbucket is aready configured! Skipping..." && exit
  fi

  touch "$KNOWN_HOSTS_FILE"

  cp "$SSH_KEY" "$SSH_KEY_DEST"
  chmod 600 "$SSH_KEY_DEST"

  # Remove old entry
  ssh-keygen -R "$BITBUCKET_GIT_HOST"

  # Add new entry
  # TODO: read fom file
  ssh-keyscan -H "$BITBUCKET_GIT_HOST" >> ~/.ssh/known_hosts
  touch "$SSH_CONFIG_FILE"
  cat "$SSH_CONFIG" >> $SSH_CONFIG_FILE
}

setup_bitbucket
