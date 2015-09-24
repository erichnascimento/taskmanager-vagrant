#! /usr/bin/env bash

set -e

PROJECT_NAME="taskmanager-api"
PROJECT_PATH="$GOPATH/src/$PROJECT_NAME"
GIT_REPOSITORY="git@bitbucket.org:erichnascimento/taskmanager-api.git"

check_project() {
  file $PROJECT_PATH &> /dev/null
}

create_project() {
  pushd "$GOPATH/src"
  echo "Pulling $PROJECT_NAME project from: $GIT_REPOSITORY ..."
  git clone $GIT_REPOSITORY
  popd
}

update_project() {
  echo "Pulling project code"
  pushd "$PROJECT_PATH"
  git pull origin master
  popd
}

check_project || create_project

update_project
