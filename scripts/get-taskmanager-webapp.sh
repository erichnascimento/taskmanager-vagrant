#! /usr/bin/env bash

set -e

PROJECTS_FOLDER="/home/vagrant/projects"
PROJECT_NAME="taskmanager-webapp"
PROJECT_PATH="$PROJECTS_FOLDER/$PROJECT_NAME"
GIT_REPOSITORY="git@bitbucket.org:erichnascimento/taskmanager-webapp.git"

check_project() {
  file $PROJECT_PATH &> /dev/null
}

create_project() {
  mkdir -p "$PROJECT_PATH"
  pushd "$PROJECT_PATH" > /dev/null
  echo "Pulling $PROJECT_NAME project from: $GIT_REPOSITORY ..."
  git clone $GIT_REPOSITORY .
  popd > /dev/null
}

update_project() {
  echo "Pulling project code"
  pushd "$PROJECT_PATH" > /dev/null
  git pull origin master
  popd > /dev/null
}

check_project || create_project

update_project
