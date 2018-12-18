# Advent Of Code 2018 - in Elixir

[![CircleCI](https://circleci.com/gh/hvnsweeting/adventofcode2018.svg?style=svg)](https://circleci.com/gh/hvnsweeting/adventofcode2018)

## Lessons learned
- Unittest is troublesome at the beginning but super useful after a NOT SO LONG run, even 1 hour of code. Refactor then is just a breeze.
- `IO.inspect` does not work with multiple args, but can use a tuple to wrap
  them up and inspect.
- `h cond` shows help info for `cond`, same for everything else, very helpful.
- String concat uses `<>` not `+`, DateTime comparation using `DateTime.compare`, not `>` or `<`.
- Regex is super handy for parsing, `Regex.scan(~r{#(\d+)}, string)`
- When defining a anonymous function, after `->`, enter to new line for reading sake.