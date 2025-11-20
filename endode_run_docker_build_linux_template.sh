#!/bin/sh
echo "Building Docker container"
docker build -t godot-build . -f Dockerfile
if ! [ $? -eq 0 ]; then
	echo "The docker container failed in some way :("
	exit
fi
echo "Running Docker container"
docker run --rm -v $(pwd):$(pwd) -w $(pwd) godot-build
echo "Removing Docker container"
docker image rm godot-build
docker image rm fedora:35 --force
