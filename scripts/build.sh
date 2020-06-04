#!/usr/bin/env bash

set -e
BRANCH="develop"
APP=$1

function getApp() {
    APP = $(git show-branch --no-name HEAD)
}

function buildByApp() {
  case $1 in
  "mweb")
    echo "trigger build mweb"
    echo "STEP_BUILD=steop" >> $BASH_ENV
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
getApp
echo "app is s${APP}"
buildByApp $APP
