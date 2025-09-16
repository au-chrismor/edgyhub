#! /bin/bash
#
echo "Building"
#
docker build -t edgy-container .
#
echo "Running"
#
docker run -it -p 1883:1883/tcp -p 8883:8883/tcp --name edgy-container edgy-container:latest
