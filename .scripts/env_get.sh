#!/usr/bin/env bash
set -euo pipefail

env_get() {
  local KEY
  local FILE
  local VAL

  KEY=${1:-}
  FILE=${2:-".env"}

  VAL=$(grep "$KEY" "$FILE" | xargs)
  IFS="=" read -ra VAL <<< "$VAL"
  if [[ ${VAL[1]+"${VAL[1]}"} ]] ; then
    echo "${VAL[1]}" | tr -d "\r"
  fi
}
