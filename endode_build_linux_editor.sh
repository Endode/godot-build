#!/bin/sh
# export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /media/Other/Vekwrite/projects/VekwriteRPGGame/_not-for-distribution/godot_encryption_key.gdkey)
# FIXME: For some reason, trying to use LLVM right now does not work for me, so for the editor here, I am using GCC. I think something is weird with my system linker or something?? idk, guess I'll wait for an update. ranlib complains about stuff
# scons platform=linuxbsd target=editor production=yes use_lto=yes lto=thin use_llvm=yes d3d12=no deprecated=yes # If deprecated=no then the mono glue (build_assemblies.py specifically) fails
scons platform=linuxbsd target=editor production=yes d3d12=no deprecated=yes # If deprecated=no then the mono glue (build_assemblies.py specifically) fails
# mv bin/godot.linuxbsd.editor.x86_64.llvm.mono bin/godot.linuxbsd.editor.x86_64 -f
mv bin/godot.linuxbsd.editor.x86_64.mono bin/godot.linuxbsd.editor.x86_64 -f
sudo bin/godot.linuxbsd.editor.x86_64 --headless --generate-mono-glue modules/mono/glue
python3 ./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd
