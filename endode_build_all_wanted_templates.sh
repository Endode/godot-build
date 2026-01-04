#!/bin/sh
# echo "Building Linux template"
# ./endode_build_linux_template.sh
# echo "Finished Linux template"
echo "Building Windows template using MinGW"
./endode_build_windows_mingw_template.sh
echo "Finished Windows template using MinGW"

echo "Building Linux template via Docker"
sudo ./endode_run_docker_build_linux_template.sh
echo "Finished Linux template via Docker"

# echo "Building Linux ARM64 template via Docker"
# sudo ./endode_run_docker_build_linux_arm64_template.sh
# echo "Finished Linux ARM64 template via Docker"

echo "We do not build the Linux ARM64 template here"

echo "Building Linux editor"
sudo ./endode_build_linux_editor.sh
echo "Finished Linux editor"

# echo "Building Android template"
# ./endode_build_android_template.sh
# echo "Finished Android template"
# echo "NOT building Android dev/debug template"
