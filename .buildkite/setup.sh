#!/bin/bash
set -euo pipefail

echo "Setting up the pipeline..."

buildkite-agent pipeline upload << YAML
steps:
  - block: "Pause before entering name"
    prompt: "Please enter your name in the following input step."

  - input: "Enter your name"
    fields:
      - text: "Your name"
        key: "NAME"
        required: true

  - label: ":robot_face: Process Input"
    command: ".buildkite/process.sh"
YAML