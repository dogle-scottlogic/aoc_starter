#!/usr/bin/env bash

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <day_number>"
  exit 1
fi

PYTHON_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1 && pwd)"
TEMPLATES_DIR="$(cd "$PYTHON_ROOT_DIR/../templates" >/dev/null 2>&1 && pwd)"

# Run from the repository root so relative paths work the same regardless of CWD
cd "${PYTHON_ROOT_DIR}"

YEAR=$(date +%Y)
DAY_NUM=$(printf "%02d" "$1")
DAY_PY="app/days/day${DAY_NUM}.py"
TEST_PY="tests/test_day${DAY_NUM}.py"
INPUT_TXT="inputs/day${DAY_NUM}.txt"

# Create day solution file if it doesn't exist
if [ ! -f "$DAY_PY" ]; then
  cp "$TEMPLATES_DIR/python/day_template.py" "$DAY_PY"
  sed -i -e "s/<YEAR>/$YEAR/g" "$DAY_PY" -e "s/<DAY>/$DAY_NUM/g"
  echo "Created $DAY_PY"
else
  echo "$DAY_PY already exists, skipping."
fi

# Create test file if it doesn't exist
if [ ! -f "$TEST_PY" ]; then
  cp "$TEMPLATES_DIR/python/test_day_template.py" "$TEST_PY"
  sed -i -e "s/<DAY>/$DAY_NUM/g" "$TEST_PY"
  echo "Created $TEST_PY"
else
  echo "$TEST_PY already exists, skipping."
fi

# Create input file if it doesn't exist
if [ ! -f "$INPUT_TXT" ]; then
  cp "$TEMPLATES_DIR/input_template.txt" "$INPUT_TXT"
  echo "Created $INPUT_TXT"
else
  echo "$INPUT_TXT already exists, skipping."
fi
