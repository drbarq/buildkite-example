#!/bin/bash

NAME=""

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

