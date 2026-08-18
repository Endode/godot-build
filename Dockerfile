FROM fedora:35
# RUN dnf update && dnf install -y \
RUN dnf install -y \
  pkgconfig \
  libX11-devel \
  libXcursor-devel \
  libXrandr-devel \
  libXinerama-devel \
  libXi-devel \
  wayland-devel \
  mesa-libGL-devel \
  mesa-libGLU-devel \
  alsa-lib-devel \
  pulseaudio-libs-devel \
  libudev-devel \
  gcc-c++ \
  libstdc++-static \
  libatomic-static \
  clang
RUN python3 -m ensurepip --upgrade
RUN python3 -m pip install scons==4.4.0
# RUN pip3 install scons
# RUN pip3 install --upgrade scons
COPY ./endode_docker_build_linux_template.sh /tmp/endode_docker_build_linux_template.sh
COPY ./key.gdkey /tmp/key.gdkey
ENV PYTHON=python3
CMD /tmp/endode_docker_build_linux_template.sh
