#!/bin/sh
# export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /media/Other/Vekwrite/projects/VekwriteRPGGame/_not-for-distribution/godot_encryption_key.gdkey)
scons platform=linuxbsd target=editor production=yes use_lto=yes lto=thin use_llvm=yes d3d12=no deprecated=yes # If deprecated=no then the mono glue (build_assemblies.py specifically) fails
mv bin/godot.linuxbsd.editor.x86_64.llvm.mono bin/godot.linuxbsd.editor.x86_64 -f
bin/godot.linuxbsd.editor.x86_64 --headless --generate-mono-glue modules/mono/glue
./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd
