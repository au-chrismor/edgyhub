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

docker run -it \
    --device /dev/i2c-1:/dev/i2c-1 \
    --name edgy-container \
    edgy-container:latest
