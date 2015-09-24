#! /usr/bin/env bash

set -e

check_go_installation() {
  go env GOROOT &> /dev/null && echo "Go is aready installed! Skipping..."
}

install_go() {
  echo "Installing go..."
  apt-get -q update > /dev/null
  apt-get -q install -y golang > /dev/null
  apt-get -q autoremove -y > /dev/null
  echo "Go installed successfully!!!"
  echo ""
  echo "Configuring Go environment..."

  export $(echo 'GOPATH=/home/vagrant/go' | tee -a /etc/environment)

  mkdir -p $GOPATH/{src,bin,pkg}

  echo "GOPATH configured in: $GOPATH"
}

check_go_installation || install_go
