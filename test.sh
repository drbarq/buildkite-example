#!/bin/bash

# Ensure the script stops on the first error
set -e

# Build and start the Docker Compose services
docker-compose -f docker-compose.yml up --build -d

# Run tests or any other commands inside the container
docker-compose -f docker-compose.yml exec app sh -c "
    echo 'Running tests inside the Docker container...'
    ls -R /app &&
    ./hello_binary 'Buildkite'
"

# Stop and remove the Docker Compose services and containers
docker-compose -f docker-compose.yml down --volumes
