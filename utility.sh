#!/usr/bin/env bash

set -euo pipefail

LANGUAGE=$1
DAY=$2
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
TEMPLATES_DIR="$(cd "$ROOT_DIR/templates" >/dev/null 2>&1 && pwd)"

function new_day() {
    local language_dir="$1"
    local day_file="$2"
    local day_template_file="$3"
    local test_file="$4"
    local test_template_file="$5"
    local year
    local day_num
    local input_file
    
    cd "${language_dir}"
    
    year=$(date +%Y)
    day_num=$(printf "%02d" "$DAY")
    day_file="${day_file//<DAY>/$day_num}"
    test_file="${test_file//<DAY>/$day_num}"
    input_file="inputs/day${day_num}.txt"
    
    # Create day solution file if it doesn't exist
    if [ ! -f "$day_file" ]; then
        cp  "$day_template_file" "$day_file"
        sed -i -e "s/<YEAR>/$year/g" -e "s/<DAY>/$day_num/g" "$day_file"
        echo "Created $day_file"
    else
        echo "$day_file already exists, skipping."
    fi
    
    # Create test file if it doesn't exist
    if [ ! -f "$test_file" ]; then
        cp "$test_template_file" "$test_file"
        sed -i -e "s/<DAY>/$day_num/g" "$test_file"
        echo "Created $test_file"
    else
        echo "$test_file already exists, skipping."
    fi
    
    # Create input file if it doesn't exist
    if [ ! -f "$input_file" ]; then
        cp "$TEMPLATES_DIR/input_template.txt" "$input_file"
        echo "Created $input_file"
    else
        echo "$input_file already exists, skipping."
    fi
    
}

function new_python_day()
{
    local language_dir="$ROOT_DIR/python"
    local day_file_path="$language_dir/app/days/day<DAY>.py"
    local day_template_path="$TEMPLATES_DIR/python/day_template.py"
    local test_file="$language_dir/tests/test_day<DAY>.py"
    local test_template_path="$TEMPLATES_DIR/python/day_template.py"
    new_day "$language_dir" "$day_file_path" "$day_template_path" "$test_file" "$test_template_path"
}

function new_typescript_day()
{
    local language_dir="$ROOT_DIR/typescript"
    local day_file_path="$language_dir/src/days/day<DAY>.ts"
    local day_template_path="$TEMPLATES_DIR/typescript/dayTemplate.ts"
    local test_file="$language_dir/test/day<DAY>.test.ts"
    local test_template_path="$TEMPLATES_DIR/typescript/dayTemplate.test.ts"
    new_day "$language_dir" "$day_file_path" "$day_template_path" "$test_file" "$test_template_path"
}

if [ $# -ne 2 ]
then
    echo "No arguments supplied"
    exit 1
fi

if [ "$LANGUAGE" != "PYTHON" ] && [ "$LANGUAGE" != "TYPESCRIPT" ]; then
    echo "Invalid arg $LANGUAGE"
    exist 1
fi

if [ "$LANGUAGE" == "PYTHON" ]; then
    new_python_day
fi

if [ "$LANGUAGE" == "TYPESCRIPT" ]; then
    new_typescript_day
fi
