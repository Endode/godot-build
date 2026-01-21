FROM registry.gitlab.steamos.cloud/steamrt/sniper/sdk:latest
RUN apt-get update && apt-get install -y --no-install-recommends \
  scons \
  pkg-config \
  libx11-dev \
  libxcursor-dev \
  libxrandr-dev \
  libxinerama-dev \
  libxi-dev \
  libwayland-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libasound2-dev \
  libpulse-dev \
  libudev-dev \
  g++ \
  libstdc++-10-dev \
  gcc-10-plugin-dev \
  clang \
  build-essential
# RUN pip3 install scons
# RUN pip3 install --upgrade scons
COPY ./endode_docker_build_linux_template.sh /tmp/endode_docker_build_linux_template.sh
COPY ./key.gdkey /tmp/key.gdkey
ENV PYTHON=python3
CMD /tmp/endode_docker_build_linux_template.sh
