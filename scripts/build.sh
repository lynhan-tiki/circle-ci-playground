#!/usr/bin/env bash

set -e
APP_NAME=$1

function isBuild() {
    echo $(git show-branch --no-name HEAD) | head -n1 | awk '{print $1;}'
}

function buildByApp() {
  APP_NAME=$1
  echo "buid first agurment ${APP_NAME}"
  case $(isBuild) in
  $APP_NAME)
    echo "Trigger build ${APP_NAME}"
    ;;
  "BUILD_ALL")
    echo "Trigger build ALL"
    ;;
  *)
  echo "[ MINIAPP|MWEB|ALL ] are support"
  circleci-agent step halt
    ;;
  esac
}
buildByApp $1
