#! /bin/bash

containers=$(docker container ls -a | grep -v IMAGE | grep -v ubuntu | awk '{print $1}')
[ -z "$containers" ] || docker container rm $containers

images=$(docker images | grep -v TAG | grep -v ubuntu | awk '{print $3}')
[ -z "$images" ] || docker image rm $images
