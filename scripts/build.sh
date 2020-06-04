#!/usr/bin/env bash

set -e
BRANCH="develop"

function isBuild() {
    echo $(git show-branch --no-name HEAD) | head -n1 | awk '{print $1;}'
}

function buildByApp() {
  case $(isBuild $1) in
  "BUILD_MINIAPP")
    echo "Trigger build MINIAPP"
    ;;
  "BUILD_MWEB")
    echo "Trigger build MWEB"
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
