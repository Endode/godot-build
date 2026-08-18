#!/bin/sh

export ANDROID_SDK_ROOT=~/android/
export ANDROID_HOME=~/android/
scons platform=android target=template_debug arch=armv7 d3d12=no
scons platform=android target=template_debug arch=arm64v8 d3d12=no

cd platform/android/java

echo "Root is required because gradlew needs the Android SDK to be writable"
sudo ./gradlew generateGodotTemplates --info -Dorg.gradle.java.home=/opt/openjdk-bin-17/
sudo ./gradlew --stop
