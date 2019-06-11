#! /bin/bash

docker build -t test --no-cache=true .
docker run -it test

./clean_docker.sh
