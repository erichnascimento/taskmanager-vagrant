#! /usr/bin/env bash

PROJECTS_FOLDER="/home/vagrant/projects/"
PROJECT_NAME="taskmanager-webapp"
PROJECT_PATH="$PROJECTS_FOLDER/$PROJECT_NAME"

install_dependencies() {
  echo "Updating npm dependencies..."
  pushd "$PROJECT_PATH" > /dev/null
  npm install > /dev/null && npm update > /dev/null
  echo "NPM Updated!"

  echo "Updating bower dependencies..."
  bower install > /dev/null && bower update > /dev/null
  echo "Bower updated!"

  popd > /dev/null
}

stop_webapp() {
  # TODO: Try graceful shutdown
  echo "Stopping $PROJECT_NAME server..."
  pkill gulp
  echo "Stopped!"
}

serve_webapp() {
  pushd "$PROJECT_PATH" > /dev/null
  echo "Starting $PROJECT_NAME server..."
  gulp serve > gulp.log&
  popd > /dev/null
}

install_dependencies
stop_webapp
serve_webapp
