#! /bin/bash
#
echo "Building"
#
# Clean up all the bits & pieces.  You don't necessarily want to do this
docker rm edgy-container
docker rmi edgy-container:latest
docker builder prune -f
docker volume prune -f
#
docker build -t edgy-container .
#
echo "Running"
#
docker run -it -p 1883:1883/tcp -p 8883:8883/tcp --name edgy-container edgy-container:latest
