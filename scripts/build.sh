#!/usr/bin/env bash

set -e
BRANCH="develop"
APP=$1

export BUILD_STEP="test build step"
echo "BUILD_STEP ${BUILD_STEP}"

function getApp() {
    APP="mweb"
}

function buildByApp() {
  case $1 in
  "mweb")
    echo "trigger build mweb"
    BUILD_STEP="stop"
    circleci-agent step halt
    ;;
  "miniapp")
    echo "trigger build miniapp"
    ;;
  *)
      exit 1
      echo "[ MINIAPP|MWEB ] are support"
    ;;
  esac
}
#getApp
buildByApp $APP
