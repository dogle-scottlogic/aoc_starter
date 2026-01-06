#!/usr/bin/env bash

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <day_number>"
  exit 1
fi

TYPESCRIPT_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1 && pwd)"
TEMPLATES_DIR="$(cd "$TYPESCRIPT_ROOT_DIR/../templates" >/dev/null 2>&1 && pwd)"

# Run from the repository root so relative paths work the same regardless of CWD
cd "${TYPESCRIPT_ROOT_DIR}"

YEAR=$(date +%Y)
DAY_NUM=$(printf "%02d" "$1")
DAY_TS="src/days/day${DAY_NUM}.ts"
TEST_TS="test/day${DAY_NUM}.test.ts"
INPUT_TXT="inputs/day${DAY_NUM}.txt"

# Create day solution file if it doesn't exist
if [ ! -f "$DAY_TS" ]; then
  cp "$TEMPLATES_DIR/typescript/dayTemplate.ts" "$DAY_TS"
  sed -i -e "s/<YEAR>/$YEAR/g" "$DAY_TS" -e "s/<DAY>/$DAY_NUM/g"
  echo "Created $DAY_TS"
else
  echo "$DAY_TS already exists, skipping."
fi

# Create test file if it doesn't exist
if [ ! -f "$TEST_TS" ]; then
  cp "$TEMPLATES_DIR/typescript/dayTemplate.test.ts" "$TEST_TS"
  sed -i -e "s/<DAY>/$DAY_NUM/g" "$TEST_TS"
  echo "Created $TEST_TS"
else
  echo "$TEST_TS already exists, skipping."
fi

# Create input file if it doesn't exist
if [ ! -f "$INPUT_TXT" ]; then
  cp "$TEMPLATES_DIR/input_template.txt" "$INPUT_TXT"
  echo "Created $INPUT_TXT"
else
  echo "$INPUT_TXT already exists, skipping."
fi
