#!/bin/bash

NAME=""

until [ ${#NAME} -gt 0 ]
do
  echo "Script is checking for name"
  NAME=$(buildkite-agent meta-data get NAME)
  echo "Script run by $NAME"
  buildkite-agent meta-data set "NAME" "$NAME"
  sleep 5
done

