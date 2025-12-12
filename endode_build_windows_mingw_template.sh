#!/bin/sh
export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /media/Other/Vekwrite/projects/VekwriteRPGGame/_not-for-distribution/godot_encryption_key.gdkey)
export PATH="/home/endode/Programs/llvm-mingw-20250910-ucrt-ubuntu-22.04-x86_64/bin:$PATH"
scons platform=windows target=template_release production=yes use_mingw=yes use_llvm=yes use_lto=yes lto=thin d3d12=yes
mv bin/godot.windows.template_release.x86_64.llvm.mono.exe bin/godot.windows.template_release.x86_64.exe -f
mv bin/godot.windows.template_release.x86_64.llvm.mono.console.exe bin/godot.windows.template_release.x86_64.console.exe -f
