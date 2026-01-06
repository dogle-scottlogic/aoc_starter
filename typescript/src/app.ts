import * as fs from "fs";

function main() {
  const args = process.argv;
  const dayArg = args.find((arg) => arg.startsWith("day="));
  const day = dayArg ? dayArg.split("=")[1] : undefined;
  console.log(day);
  if (day != null) {
    runDay(day);
  }
}

async function runDay(rawDay: string) {
  const day = normalise_day(rawDay);
  const moduleName: string = `../src/days/day${day}.ts`;
  const inputPath: string = `inputs/day${day}.txt`;
  const run = await import(moduleName);
  const data = loadData(inputPath);
  console.log(`Running day ${rawDay} parts 1 and 2`);
  run.part1(data);
  run.part2(data);
}

function loadData(path: string): string {
  return fs.readFileSync(path, "utf-8");
}

function normalise_day(day: string): string {
  assertIsNumber(day);
  if (Number(day) < 10) {
    return `0${day}`;
  }
  return day;
}

function assertIsNumber(value: unknown): asserts value is number {
  const valueAsNumber = Number(value);
  if (typeof valueAsNumber !== "number") throw new Error("Not a number");
}

main();
