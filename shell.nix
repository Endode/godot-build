{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    scons
    python3
    wayland-scanner
    # gcc
    clang
  ];

  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXfixes
    xorg.libXext

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
