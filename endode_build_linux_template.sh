#!/bin/sh
# export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /media/Other/Vekwrite/projects/VekwriteRPGGame/_not-for-distribution/godot_encryption_key.gdkey)
export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /home/endode/Desktop/flutterby_godot_encryption_key.gdkey)
# echo ENDODES LINUX TEMPLATE HAS BEEN DISABLED
scons platform=linuxbsd target=template_release production=yes use_lto=yes lto=thin use_llvm=yes d3d12=no
mv bin/godot.linuxbsd.template_release.x86_64.llvm.mono bin/godot.linuxbsd.template_release.x86_64 -f
