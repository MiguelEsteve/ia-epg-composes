#!/usr/bin/env bash
set -e

echo "==== WARNING: This will DELETE local databases ===="
echo "/home/miguel/circulars_db"
echo "/home/miguel/controller_db"
echo "/home/miguel/prueba16"
read -p "Continue? (y/N): " CONFIRM

if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "Aborted"
    exit 1
fi

echo "==== Removing database folders ===="
sudo rm -rf /home/miguel/circulars_db
sudo rm -rf /home/miguel/controller_db
sudo rm -rf /home/miguel/prueba16
sudo rm -rf /home/miguel/logs

echo "==== Stopping running containers ===="
RUNNING=$(docker ps -q)
if [ -n "$RUNNING" ]; then
    docker stop $RUNNING
else
    echo "No running containers"
fi

echo "==== Removing all containers ===="
CONTAINERS=$(docker ps -a -q)
if [ -n "$CONTAINERS" ]; then
    docker rm $CONTAINERS
else
    echo "No containers to remove"
fi

echo "==== Removing all images ===="
IMAGES=$(docker images -q)
if [ -n "$IMAGES" ]; then
    docker rmi -f $IMAGES
else
    echo "No images to remove"
fi

echo "==== Building and starting compose ===="
docker compose \
    --env-file env_recorder_srt_all.env \
    -f docker-compose_recorder_srt_all.yaml \
    -p my \
    up --build

