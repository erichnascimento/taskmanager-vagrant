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

check_node_installation() {
  node --version &> /dev/null && echo "Node is already installed! Skipping..."
}

install_node() {
  echo "Installing NodeJs..."
  curl -sL https://deb.nodesource.com/setup_4.x | bash -
  apt-get -q update > /dev/null
  apt-get -q install -y nodejs > /dev/null
  apt-get -q autoremove -y > /dev/null
  echo "NodeJs installed successfully!!!"
}

check_n_instalation() {
  n --version &> /dev/null && "N is already installed! Skipping..."
}

install_n() {
  echo "Installing n..."
  npm install -g n
  echo "n installed successfully!"
  n 0.10.0
}

check_gulp() {
  gulp -v &> /dev/null && echo "Gulp is already installed! Skipping..."
}

install_gulp() {
  echo "Installing Gulp..."
  npm install -g gulp > /dev/null
  echo "Gulp installed!"
}

check_bower() {
  bower -v &> /dev/null && echo "Bower is already installed! Skipping..."
}

install_bower() {
  echo "Installing Bower..."
  npm install -g bower > /dev/null
  echo "Bower installed!"
}

check_git_installation || install_git
check_node_installation || install_node
check_n_instalation || install_n
check_gulp || install_gulp
check_bower || install_bower
