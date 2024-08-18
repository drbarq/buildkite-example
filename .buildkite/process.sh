#!/bin/bash
set -euo pipefail

NAME=$(buildkite-agent meta-data get NAME)
echo "Retrieved NAME from meta-data: $NAME"

# Your original script logic
until [ ${#NAME} -gt 0 ]
do
  echo "Script is checking for NAME"
  NAME=$(buildkite-agent meta-data get NAME)
  echo "Script run by $NAME"
  buildkite-agent meta-data set "NAME" "$NAME"
  NAME2=$(buildkite-agent meta-data get NAME)
  echo "stored var $NAME2"
  sleep 5
done

buildkite-agent pipeline upload << YAML
steps:
  - label: "Retrieve NAME"
    command: |
      echo "Retrieving NAME from metadata..."
      BUILDKITE_NAME=\$(buildkite-agent meta-data get NAME || echo "DefaultName")
      buildkite-agent meta-data set BUILDKITE_NAME "\$BUILDKITE_NAME"
      echo "BUILDKITE_NAME is set to: \$BUILDKITE_NAME"

  - label: ":docker: Build"
    plugins:
      - docker-compose#v5.3.0:
          build: app

  - wait

  - label: "Run Hello Binary with Name"
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