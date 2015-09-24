#! /usr/bin/env bash

set -e

check_git_installation() {
  git --version &> /dev/null && echo "Git is already installed! Skipping..."
}

install_git() {
  echo "Installing git..."
  apt-get -q update > /dev/null
  apt-get -q install -y git > /dev/null
  apt-get -q autoremove -y > /dev/null
  echo "Git installed successfully!!!"
}

check_git_installation || install_git
