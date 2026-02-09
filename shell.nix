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


  # shellHook = ''
  #   export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath (with pkgs; [
  #     xorg.libX11
  #     xorg.libXcursor
  #     xorg.libXinerama
  #     xorg.libXi
  #     xorg.libXrandr
  #     libGL
  #     vulkan-loader
  #     alsa-lib
  #     libpulseaudio
  #     udev
  #   ])}"
  # '';
}
