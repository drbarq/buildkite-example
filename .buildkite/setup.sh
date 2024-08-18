#!/bin/bash
set -euo pipefail

echo "Setting up the pipeline..."
buildkite-agent pipeline upload .buildkite/dynamic_steps.yml