#!/usr/bin/env bash

set -e
BRANCH="develop"

function isBuild() {
    echo $(git show-branch --no-name HEAD) | grep $1
}

function buildByApp() {
  echo $(isBuild $1)
  case $APP in
  "BUILD_MINIAPP")
    echo "trigger build miniapp"
    ;;
  "BUILD_MWEB")
    echo "trigger build mweb"
    ;;
  "BUILD_ALL")
    echo "trigger build all"
    ;;
  *)
      exit 1
      echo "[ MINIAPP|MWEB ] are support"
    ;;
  esac
}
buildByApp $1
