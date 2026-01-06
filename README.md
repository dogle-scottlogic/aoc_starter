
# Advent Of Code Starter

This repository contains a starter framework for the Advent of Code programming challenges. Each day's puzzle is implemented in a modular way, with input files and tests.

## Supported Languages

Currently supported languages are:

* Python
* TypeScript

## Project Structure

The repository is organized to support multiple languages and make adding new Advent of Code days easy.

```ascii
aoc_starter/
├─ .github/              # GitHub Actions workflows and configs
├─ .vscode/              # Optional Visual Studio Code workspace settings
├─ python/               # Python implementation AoC boilerplate
│  ├─ app/               # Python app code (e.g., entry & utilities)
│  |   ├─ days/          # Python puzzle solution modules (dayXX.py)
│  ├─ inputs/            # Puzzle input files for Python
│  ├─ scripts/           # Utility bash script files
│  └─ tests/             # Pytest tests for Python solutions
├─ templates/            # Templates used to scaffold new days
├─ typescript/           # TypeScript implementation AoC boilerplate
│  ├─ src/               # TypeScript source files (days & utils)
│  |   ├─ days/          # TypeScript puzzle solution modules (dayXX.py)
│  ├─ inputs/            # Puzzle input files for TypeScript
│  └─ tests/             # Jest tests for TS solutions
├─ .gitignore            # Git ignore rules
├─ LICENSE               # MIT license
└─ README.md             # Project overview and instructions
```

## How to Run the Code

## Quick Start

1. Fork this repository.
2. Ensure that you have the correct [requirements](#requirements) installed.
3. From a bash terminal navigate to the directory of the language you want: [Python](/python/) / [TypeScript](/typescript/).
4. Run `./run all` / `npm run day <DAY>`
5. [Create a new day](#how-to-add-a-new-day) if required.

## Python

### Script Options

The `scripts/run.sh` script provides several commands to manage the environment, install dependencies, run tests, and execute solutions. Usage:

```bash
./run.sh [command] [args...]
```

Available commands:

* `venv` — Create the `.venv` virtual environment (if missing) and activate it for the script run.
* `install` — Create the virtual environment and install dependencies from `requirements.txt`.
* `test` — Run all tests using `pytest` inside the virtual environment.
* `day` — Run the app for a specific day. For example, `./run.sh day 2` runs the solution for day 2 using the corresponding input file.
* `all` — Perform install, test, and then run (default if no command is given).

Example usage:

```bash
# Create and activate the virtual environment
./run.sh venv

# Install dependencies
./run.sh install

# Run all tests
./run.sh test

# Run the solution for day 2
./run.sh day 2

# Do install, test, and run in sequence
./run.sh all
```

This will execute the solution for the specified day using the corresponding input file from the `inputs/` directory.

### How to Run the Tests

The project uses `pytest` for testing. To run all tests:

```bash
pytest
```

Or, to run tests for a specific day:

```bash
pytest tests/test_day02.py
```

### How to Add a New Day

The quickest way to generate boilerplate files for a new day is to use the `new_day.sh` script:

```bash
./scripts/new_day.sh 3
```

This creates:

* `app/days/day03.py` — Solution file with `part1()` and `part2()` function stubs
* `tests/test_day03.py` — Test file with placeholder test cases
* `inputs/day03.txt` — Empty input file

If you prefer to create files manually:

1. **Create the solution file:**
    * Copy an existing day file (e.g., `app/days/day01.py`) to a new file (e.g., `app/days/day03.py`).
    * Implement the solution for the new day.
2. **Add the input file:**
    * Place the input for the new day in `inputs/day03.txt`.
3. **Write tests:**
    * Create a new test file (e.g., `tests/test_day03.py`) based on previous days' tests.
    * Add test cases for your solution.

After setting up the new day, implement your solution and tests, then run:

```bash
./scripts/run.sh test     # Run tests
./scripts/run.sh day 3    # Run the solution for day 3
```

### Requirements

* Python 3.10+
* Install dependencies with:

```bash
pip install -r requirements.txt
```

---

## TypeScript

### NPM Script Options

The npm scripts provide several commands to manage the environment, install dependencies, run tests and execute solutions. Usage:

```bash
   npm run [command]
```

Available commands:

* `install` — Install dependencies from `[package.json](/typescript/package.json)`.
* `test` — Run all tests using `jest`.
* `day` — Run the app for a specific day. For example, `npm run day 2` runs the solution for day 2 using the corresponding input file.

### How to Add a New Day (TypeScript)

The quickest way to generate boilerplate files for a new day is to use the `[new_day.sh](./typescript/scripts/new_day.sh)` script:

```bash
   ./scripts/new_day.sh 3
```

This creates:

* `src/days/day03.ts` — Solution file with `part1()` and `part2()` function stubs
* `tests/day03.test.ts` — Test file with placeholder test cases
* `inputs/day03.txt` — Empty input file

After setting up the new day, implement your solution and tests, then run:

```bash
npm run test     # Run tests
npm run day 3    # Run the solution for day 3
```

### Requirements (TypeScript)

* Node v24+
* Install dependencies with:

```bash
npm install
```

---
