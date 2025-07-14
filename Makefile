include config/docker_config.mk

TOOLCHAIN_PREFIX ?= riscv64-unknown-elf-

OBJCOPY           = $(TOOLCHAIN_PREFIX)objcopy
LD                = $(TOOLCHAIN_PREFIX)ld
AS                = $(TOOLCHAIN_PREFIX)as
GCC               = $(TOOLCHAIN_PREFIX)gcc

# Help message
.PHONY: help
help:
	@echo "\e[36mdocker_build\e[0m" - Build the docker image
	@echo "\e[36mdocker_start\e[0m" - Start the docker container
	@echo "\e[36mdocker_stop \e[0m" - Stop the docker container
	@echo "\e[36mdocker_check\e[0m" - Check docker image and container
	@echo "\e[36mdocker_prune\e[0m" - Remove unwanted docker usage

#=============================== Docker Commands ===============================
# Build the Docker image
.PHONY: docker_build
docker_build:
	@docker build -t $(DOCKER_PATH) ./docker

# Start the Docker build container and / or update tools
.PHONY: docker_start
docker_start:
	@docker image pull $(DOCKER_PATH)
	@docker inspect $(CONTAINER)$(QUIET) && { docker stop $(CONTAINER)$(QUIET); docker rm $(CONTAINER)$(QUIET); } || echo "Creating $(CONTAINER)"
	@docker run -it -d --name $(CONTAINER) -e "PIC_SDK_BASE=$(ROOT_DIR)" \
		--restart=always --add-host=host.docker.internal:host-gateway \
		-v $(PWD):$(ROOT_DIR) \
		-w $(ROOT_DIR) $(DOCKER_PATH)

# Remove the docker image and container
.PHONY: docker_stop
docker_stop:
	@docker stop $(CONTAINER)$(QUIET)
	@docker rm $(CONTAINER)$(QUIET)
	@docker image rm $(DOCKER_PATH)$(QUIET)

# Check docker image and container
.PHONY: docker_check
docker_check:
	@echo "\e[36mIMAGE LIST:\e[0m"
	@docker image ls
	@echo "\e[36mCONTAINER LIST:\e[0m"
	@docker container ls
	@echo "\e[36mDISK USAGE:\e[0m"
	@docker system df

# Remove unwanted docker usage
.PHONY: docker_prune
docker_prune:
	@docker system prune -a -f

# Make gdb more insight
.PHONY: gdb_dashboard
gdb_dashboard:
	wget -P ~ https://github.com/cyrus-and/gdb-dashboard/raw/master/.gdbinit
