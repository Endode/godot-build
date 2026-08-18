#!/bin/sh

export ANDROID_SDK_ROOT=~/android/
export ANDROID_HOME=~/android/
export SCRIPT_AES256_ENCRYPTION_KEY=$(cat /media/Other/Vekwrite/projects/VekwriteRPGGame/_not-for-distribution/godot_encryption_key.gdkey)
scons platform=android target=template_release production=yes use_lto=yes arch=armv7 d3d12=no
scons platform=android target=template_release production=yes use_lto=yes arch=arm64v8 d3d12=no

cd platform/android/java

echo "Root is required because gradlew needs the Android SDK to be writable"
sudo ./gradlew generateGodotTemplates --info -Dorg.gradle.java.home=/opt/openjdk-bin-17/
sudo ./gradlew --stop
