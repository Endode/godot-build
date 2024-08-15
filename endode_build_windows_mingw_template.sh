#!/bin/sh
export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /media/Other/Vekwrite/projects/VekwriteRPGGame/_not-for-distribution/godot_encryption_key.gdkey)
scons platform=windows target=template_release production=yes use_mingw=yes use_lto=yes d3d12=no
mv bin/godot.windows.template_release.x86_64.mono.exe bin/godot.windows.template_release.x86_64.exe -f
mv bin/godot.windows.template_release.x86_64.mono.console.exe bin/godot.windows.template_release.x86_64.console.exe -f
