include config/docker_config.mk

# Help message
.PHONY: help
help:
	@echo Help message

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
