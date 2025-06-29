#!/bin/bash

# Define shared network names
SHARED_NETWORKS=("local-kafka" "ollama-docker")

for NETWORK in "${SHARED_NETWORKS[@]}"; do
  if ! docker network ls --format '{{.Name}}' | grep -wq "$NETWORK"; then
    echo "Creating Docker network: $NETWORK"
    docker network create "$NETWORK"
  else
    echo "Docker network '$NETWORK' already exists"
  fi
done

# Run docker compose
docker compose up -d

