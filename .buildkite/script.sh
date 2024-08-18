#!/bin/bash

NAME=""

until [ ${#NAME} -gt 0 ]
do
  echo "Script is checking for name"
  NAME=$(buildkite-agent meta-data get name)
  echo "Script run by $NAME"
  sleep 5
done

