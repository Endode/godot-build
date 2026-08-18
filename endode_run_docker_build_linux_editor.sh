#!/bin/sh
echo "Building Docker container for editor"
docker build -t godot-build-editor . -f Dockerfile-editor
if ! [ $? -eq 0 ]; then
	echo "The docker container failed in some way :("
	exit
fi
echo "Running Docker container for editor"
docker run --rm -v $(pwd):$(pwd) -w $(pwd) godot-build-editor
echo "Removing Docker container for editor"
docker image rm godot-build-editor
docker image rm fedora:40 --force
