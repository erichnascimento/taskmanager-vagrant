#! /usr/bin/env bash

set -e

PROJECT_NAME="taskmanager-api"
PROJECT_PATH="$GOPATH/src/$PROJECT_NAME"
GIT_REPOSITORY="https://erichnascimento@bitbucket.org/erichnascimento/$PROJECT_NAME.git/"

check_project() {
  file $PROJECT_PATH &> /dev/null
}

create_project() {
  pushd "$GOPATH/src"
  ssh-keyscan -t rsa bitbucket.org
  echo "Pulling $PROJECT_NAME project from: $GIT_REPOSITORY ..."
  git clone $GIT_REPOSITORY
  popd
}

update_project() {
  echo "Update"
}

check_project || create_project

update_project
