#!/bin/bash
set -euo pipefail

ACTION=$(buildkite-agent meta-data get action)

if [ "$ACTION" = "enter_name" ]; then
  buildkite-agent pipeline upload << YAML
steps:
  - input: "Enter your name"
    fields:
      - text: "Your name"
        key: "NAME"
        required: true

  - label: "Debug NAME variable"
    command: |
      echo "NAME from meta-data: \$(buildkite-agent meta-data get NAME)"

  - block: ":thinking_face: What now?"
    prompt: "Choose the next action"
    fields:
      - select: "Action"
        key: "action"
        options:
          - label: ":wave: Say hello"
            value: "say_hello"

  - label: ":robot_face: Process Input"
    command: ".buildkite/process.sh"
YAML
elif [ "$ACTION" = "say_hello" ]; then
  NAME=$(buildkite-agent meta-data get NAME)
  buildkite-agent pipeline upload << YAML
steps:
  - label: "Run Hello Binary in Docker"
    command: |
      echo "Running Docker with NAME: $NAME"
      docker-compose run --rm app ./hello_binary "$NAME"

  - block: ":thinking_face: What now?"
    prompt: "Choose the next action"
    fields:
      - select: "Action"
        key: "action"
        options:
          - label: ":input_numbers: Enter a new name"
            value: "enter_name"
          - label: ":wave: Say hello again"
            value: "say_hello"

  - label: ":robot_face: Process Input"
    command: ".buildkite/process.sh"
YAML
fi