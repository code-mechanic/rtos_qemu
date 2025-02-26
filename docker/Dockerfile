# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install --no-install-recommends -y \
  ca-certificates \
  sudo \
  gdb-multiarch \
  gcc-riscv64-unknown-elf \
  binutils-common \
  make \
  curl \
  git-core \
  wget \
  nano \
  ssh \
  tree \
  less \
  build-essential \
  python3 \
  python3-dev \
  binutils \
  make \
  binutils-riscv64-linux-gnu \
  qemu-system-riscv32 \
  zsh \
  xxd \
  strace \
  man

# terminal colors with xterm
ENV TERM xterm

# Set default command
CMD ["/bin/bash"]