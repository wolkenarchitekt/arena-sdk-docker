
ARCH := $(shell uname -m)

DOCKER_TAG := arena
LIB_DIR := ./lib
ARENA_PYTHON_SDK := arena_api-2.7.1-py3-none-any

ifeq ($(ARCH),x86_64)
	ARENA_SDK_TAR := ArenaSDK_v0.1.95_Linux_x64.tar.gz
	ARENA_SDK_CONF := Arena_SDK_Linux_x64.conf
endif

ifeq ($(ARCH),aarch64)
	ARENA_SDK_TAR := ArenaSDK_v0.1.78_Linux_ARM64.tar.gz
	ARENA_SDK_CONF := Arena_SDK_ARM64.conf
endif

build:
	docker build \
		--build-arg LIB_DIR=$(LIB_DIR) \
		--build-arg ARENA_SDK_TAR=$(ARENA_SDK_TAR) \
		--build-arg ARENA_SDK_CONF=$(ARENA_SDK_CONF) \
		--build-arg ARENA_PYTHON_SDK=$(ARENA_PYTHON_SDK) \
		 -t $(DOCKER_TAG) .

test:
	docker run --network host --rm -it $(DOCKER_TAG) \
		/src/arena-sdk/Examples/Arena/Cpp_Acquisition/Cpp_Acquisition
