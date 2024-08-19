#!/bin/bash
set -euo pipefail

DOCKER_USERNAME="your-docker-usernsdfsdafame"
DOCKER_PASSWORD="your-docker-passwosadfasdfrd"


echo "Script is checking for NAME"
NAME=$(buildkite-agent meta-data get NAME)
echo "Script run by $NAME"
buildkite-agent meta-data set "DOCKER_USERNAME" "$DOCKER_USERNAME"
buildkite-agent meta-data set "DOCKER_PASSWORD" "$DOCKER_PASSWORD"
DOCKER_USERNAME_BUILD=$(buildkite-agent meta-data get DOCKER_USERNAME)
DOCKER_PASSWORD_BUILD=$(buildkite-agent meta-data get DOCKER_PASSWORD)
echo "stored var $DOCKER_USERNAME_BUILD, $DOCKER_PASSWORD_BUILD"
sleep 5


