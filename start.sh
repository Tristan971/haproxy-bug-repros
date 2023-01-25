#!/usr/bin/env bash

set -euo pipefail

PWD=$(pwd)
export PWD
echo "PWD => $PWD"

function help() {
    echo "Usage: start.sh [haproxy binary]"
    echo "   eg: start.sh /path/to/haproxy"
}

if ! [ -f "${1:-}" ]; then
  help
  exit 1
else
  echo "HAProxy => $1"
fi

set -x
exec "$1" -Ws -f ./haproxy.cfg -p haproxy.pid
