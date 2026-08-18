#!/bin/sh
docker run --rm --privileged tonistiigi/binfmt --install all
docker buildx create --name armbuilder --use
echo "Building Docker container (godot-arm64)"
docker buildx build --platform linux/arm64 -t godot-arm64 --load . -f Dockerfile-arm64
if ! [ $? -eq 0 ]; then
	echo "The docker container failed in some way :("
	exit
fi
echo "Running Docker container (godot-arm64)"
docker run --rm -v $(pwd):$(pwd) -w $(pwd) godot-arm64
echo "Removing Docker container (godot-arm64)"
docker image rm godot-arm64
docker image rm fedora:35 --force
