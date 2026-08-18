#!/bin/sh
if ! [ -f /.dockerenv ]; then
    echo "This file is actually meant to be ran from inside the Docker container, you're not meant to be running it yourself, so erm, bye"
    exit
fi

export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /tmp/key.gdkey)
scons platform=linuxbsd target=editor production=yes lto=none d3d12=no deprecated=yes accesskit=no # If deprecated=no then the mono glue (build_assemblies.py specifically) fails
mv bin/godot.linuxbsd.editor.x86_64.mono bin/godot.linuxbsd.editor.x86_64 -f
sudo bin/godot.linuxbsd.editor.x86_64 --headless --generate-mono-glue modules/mono/glue
python3 ./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd
