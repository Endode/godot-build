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
  lld \
  llvm \
  build-essential
# RUN pip3 install scons
# RUN pip3 install --upgrade scons
COPY ./endode_docker_build_linux_template.sh /tmp/endode_docker_build_linux_template.sh
COPY ./key.gdkey /tmp/key.gdkey
ENV PYTHON=python3
RUN git config --global --add safe.directory '*'
RUN mkdir -p /opt/llvm-bin && \
    ln -s /usr/bin/clang /opt/llvm-bin/gcc && \
    ln -s /usr/bin/clang++ /opt/llvm-bin/g++ && \
    ln -s /usr/bin/lld /opt/llvm-bin/ld && \
    ln -s /usr/bin/llvm-ar /opt/llvm-bin/ar && \
    ln -s /usr/bin/llvm-ranlib /opt/llvm-bin/ranlib && \
    ln -s /usr/bin/llvm-nm /opt/llvm-bin/nm
ENV PATH="/opt/llvm-bin:${PATH}"
CMD /tmp/endode_docker_build_linux_template.sh
