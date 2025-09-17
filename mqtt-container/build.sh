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
rm -rf $PWD/data
mkdir -p $PWD/data/conf/conf.d
mkdir -p $PWD/data/log
mkdir -p $PWD/data/data
# If you mount the volumes locally,
# make sure you copy the config in first
cp -v mosquitto.conf $PWD/data/conf
cp -v default.conf $PWD/data/conf/conf.d

docker run -it \
    -p 1883:1883/tcp \
    -p 8883:8883/tcp \
    -v "$PWD/data/conf:/mosquitto/conf" \
    --name edgy-container \
    edgy-container:latest
