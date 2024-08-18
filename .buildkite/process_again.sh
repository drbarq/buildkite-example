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

  - label: ":robot_face: Process Input"
    command: ".buildkite/process.sh"
YAML
elif [ "$ACTION" = "say_hello" ]; then
  buildkite-agent pipeline upload << YAML
steps:
  - label: "Run Hello Binary with Name Again"
    plugins:
      - docker-compose#v5.3.0:
          run: app
          command: ["./hello_binary", "\$\$BUILDKITE_NAME"]
          propagate-environment: true

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

  - label: ":robot_face: Process Input Again"
    command: ".buildkite/process_again.sh"
YAML
fi