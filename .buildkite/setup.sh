#!/bin/bash
set -euo pipefail

echo "Setting up the pipeline..."

buildkite-agent pipeline upload << YAML
steps:
  - block: ":thinking_face: What now?"
    prompt: "Choose the next action"
    fields:
      - select: "Action"
        key: "action"
        options:
          - label: ":input_numbers: Enter your name"
            value: "enter_name"
          - label: ":wave: Say hello"
            value: "say_hello"

  - label: ":robot_face: Process Input"
    command: ".buildkite/process.sh"
YAML