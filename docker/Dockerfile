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
  python3-pip \
  python3-dev \
  binutils \
  binutils-riscv64-linux-gnu \
  qemu-system-riscv32 \
  zsh \
  xxd \
  strace \
  man \
  qemu-system-arm \
  gcc-arm-none-eabi

# gdb dashboard install
RUN wget -P ~ https://github.com/cyrus-and/gdb-dashboard/raw/master/.gdbinit
RUN pip3 install pygments

# terminal colors with xterm
ENV TERM xterm

# Set default command
CMD ["/bin/bash"]