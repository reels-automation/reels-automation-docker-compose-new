# !/bin/bash

docker network create local-kafka
docker network create ollama-docker
docker network create minio-admin-files
docker network create minio-network
docker network create api-gateway
docker network create mongo-network
