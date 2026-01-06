#!/usr/bin/env bash

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <day_number>"
  exit 1
fi


npm run run-day -- day="$1"
