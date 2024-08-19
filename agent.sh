#!/bin/bash
set -euo pipefail

if [[ "$BUILDKITE_PIPELINE_SLUG" == "your-pipeline-slug" ]]; then
  export DOCKER_USERNAME="your-docker-usernsdfsdafame"
  export DOCKER_PASSWORD="your-docker-passwosadfasdfrd"
fi