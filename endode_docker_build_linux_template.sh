#!/bin/sh
if ! [ -f /.dockerenv ]; then
    echo "This file is actually meant to be ran from inside the Docker container, you're not meant to be running it yourself, so erm, bye"
    exit
fi

export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /tmp/key.gdkey)
scons platform=linuxbsd target=template_release production=yes use_lto=yes d3d12=no
mv bin/godot.linuxbsd.template_release.x86_64.mono bin/godot.linuxbsd.template_release.x86_64 -f
