#!/usr/bin/env bash

BRANCH="develop"
APP=$1
set -e

function getApp() {
    APP="mweb"
}

function buildByApp() {
  case $1 in
  "mweb")
    echo "trigger build mweb"
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
