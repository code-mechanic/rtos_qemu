REPO_NAME         := rtos_qemu
DOCKER_IMG        := ghcr.io/code-mechanic/$(REPO_NAME)
DOCKER_VERSION    := latest
DOCKER_PATH       := $(DOCKER_IMG):$(DOCKER_VERSION)
CONTAINER         := $(REPO_NAME)_container
ROOT_DIR          := /home/$(REPO_NAME)
QUIET             := >/dev/null 2>&1

# Run commands in the local docker container if not in said container
# On Windows, you must use PowerShell or some environment that supports `which`
# or always run in Docker
ifeq (, $(shell which docker))
  DOCKER :=
else
  DOCKER := docker exec $(CONTAINER)
endif
