{ pkgs ? import <nixpkgs> {} }:

let
  dotnet-sdk = pkgs.dotnet-sdk_8;
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    dotnet-sdk
    pkg-config
    scons
    python3
    wayland-scanner
    gettext
    gcc
    # clang
  ];

  buildInputs = with pkgs; [
    libx11
    libxcursor
    libxinerama
    libxi
    libxrandr
    libxrender
    libxfixes
    libxext

    wayland
    wayland-protocols
    libxkbcommon

    libGL
    vulkan-loader
    vulkan-headers

    alsa-lib
    libpulseaudio

    udev
    dbus
    fontconfig
  ];

  # No idea if I need this stuff or not
  shellHook = ''
    export DOTNET_ROOT="${dotnet-sdk}/share/dotnet"
    export MSBuildSDKsPath="${dotnet-sdk}/share/dotnet/sdk/${(builtins.parseDrvName dotnet-sdk.name).version}/Sdks"
    export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
  '';
}
