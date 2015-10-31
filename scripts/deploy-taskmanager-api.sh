#! /usr/bin/env bash

PROJECT_NAME="taskmanager-api"
PROJECT_PATH="$GOPATH/src/$PROJECT_NAME"
SERVER_BIN="$PROJECT_PATH/$PROJECT_NAME"

install_dependencies() {
  echo "Installing Go libraries..."
  pushd "$PROJECT_PATH" > /dev/null
  go get -u
  popd > /dev/null
  echo "Installed!"
}

stop_api_server() {
  # TODO: Try graceful shutdown
  echo "Stopping $PROJECT_NAME server..."
  pkill $PROJECT_NAME
  echo "Stopped!"
}

compile_project() {
  echo "Compiling $PROJECT_NAME..."
  pushd $PROJECT_PATH > /dev/null
  go build
  popd > /dev/null
  echo "Compiled successfully!"
}

run_api_server() {
  echo "Start $PROJECT_NAME server..."
  $SERVER_BIN -p 8080 &> $PROJECT_PATH/access.log&
}

install_dependencies && \
  stop_api_server && \
  compile_project && \
  run_api_server
