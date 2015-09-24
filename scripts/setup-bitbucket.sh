#! /usr/bin/env bash

set -e

BITBUCKET_GIT_HOST="bitbucket.org"
KNOWN_HOSTS_FILE="/root/.ssh/known_hosts"
SSH_CONFIG_FILE="/root/.ssh/config"
SSH_KEY="/vagrant/ssh/taskmanager-vagrant.rsa"
SSH_CONFIG="/vagrant/ssh/config"



setup_bitbucket() {

  #TODO: Refatory this
  if [[ -f "$KNOWN_HOSTS_FILE" ]]; then
    echo "Bitbucket is aready configured! Skipping..." && exit
  fi

  touch "$KNOWN_HOSTS_FILE"

  # Remove old entry
  ssh-keygen -R "$BITBUCKET_GIT_HOST"

  # Add new entry
  # TODO: read fom file
  ssh-keyscan -H "$BITBUCKET_GIT_HOST" >> ~/.ssh/known_hosts
  touch "$SSH_CONFIG_FILE"
  cat "$SSH_CONFIG" >> $SSH_CONFIG_FILE
}

setup_bitbucket
