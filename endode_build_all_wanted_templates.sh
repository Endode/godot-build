#!/bin/sh
# echo "Building Linux template"
# ./endode_build_linux_template.sh
# echo "Finished Linux template"
echo "Building Windows template using MinGW"
./endode_build_windows_mingw_template.sh
echo "Finished Windows template using MinGW"
echo "Building Android template"
./endode_build_android_template.sh
echo "Finished Android template"

echo "NOT building Android dev/debug template"
