#! /usr/bin/env bash

check_mongo_installation()  {
  service mongod status &> /dev/null && echo "Mongo is aready installed! Skipping..."
}

install_mongo() {
  echo "installing MongoDB"

  # Import the public key used by the package management system
  apt-key -q adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

  # Create a list file for MongoDB
  echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" \
    | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

  # Reload local package database
  apt-get -q update

  # Install the MongoDB packages
  apt-get -q install -y mongodb-org

  # Start mongodb
  service mongod start

  # Clean up
  apt-get -q autoremove -y

  echo "MongoDB installed successfully!!!"
}

check_mongo_installation || install_mongo
