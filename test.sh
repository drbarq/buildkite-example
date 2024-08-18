#!/bin/bash

# Ensure the script stops on the first error
set -e

# Build and start the Docker Compose services
docker-compose -f docker-compose.yml up --build -d

# Run tests or any other commands you need inside the container
# Assuming that your 'app' service in the docker-compose.yml is the one to test
docker-compose -f docker-compose.yml exec app sh -c "
    echo 'Running tests inside the Docker container...'
    ls -R /app &&
    cat /app/hello_dir/hello.go &&
    cd /app/hello_dir &&
    GO111MODULE=off go build -o ../hello_binary hello.go &&
    ../hello_binary 'Buildkite'
"

# Stop and remove the Docker Compose services and containers
docker-compose -f docker-compose.yml down --volumes
