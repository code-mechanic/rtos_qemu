DOCKER_IMG        := ghcr.io/code-mechanic/risc_v_qemu
DOCKER_VERSION    := latest
DOCKER_PATH       := $(DOCKER_IMG):$(DOCKER_VERSION)
CONTAINER         := risc_v_qemu_container
ROOT_DIR          := /home/risc_v_qemu
QUIET             := >/dev/null 2>&1

# Run commands in the local docker container if not in said container
# On Windows, you must use PowerShell or some environment that supports `which`
# or always run in Docker
ifeq (, $(shell which docker))
  DOCKER :=
else
  DOCKER := docker exec $(CONTAINER)
endif
