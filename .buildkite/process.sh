#!/bin/bash
set -euo pipefail

NAME=$(buildkite-agent meta-data get NAME)
echo "Retrieved NAME from meta-data: $NAME"

buildkite-agent pipeline upload << YAML
steps:
  - label: "Debug NAME variable"
    command: |
      echo "NAME from meta-data: \$(buildkite-agent meta-data get NAME)"

  - label: "Run Hello Binary in Docker"
    command: |
      NAME=\$(buildkite-agent meta-data get NAME)
      echo "Running Docker with NAME: \$NAME"
      docker-compose run --rm app ./hello_binary "\$NAME"

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

if [ "$(buildkite-agent meta-data get action)" = "enter_name" ]; then
  buildkite-agent pipeline upload << YAML
steps:
  - input: "Enter your name"
    fields:
      - text: "Your name"
        key: "NAME"
        required: true

  - label: ":robot_face: Process Input"
    command: ".buildkite/process.sh"
YAML
fi