#!/bin/bash

set -e

BUILD="build_$1"

function isBuild() {
    echo $(git show-branch --no-name HEAD) | head -n1 | awk '{print $1;}'
}

function buildByApp() {
  case $(isBuild) in
  $1)
    echo "YES::Trigger build $1"
    ;;
  "build_all")
    echo "YES::Start build $1"
    ;;
  *)
  echo "NOOOOOO: SAVE MY TIME, PLEASE STOP!"
  circleci-agent step halt
    ;;
  esac
}
buildByApp $BUILD
