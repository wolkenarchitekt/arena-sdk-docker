# arena-sdk-docker

Dockerfile for Lucid Vision [ArenaSDK](https://thinklucid.com/arena-software-development-kit/).
Docker container includes:

* ArenaSDK - x64/ARM64
* Arena Python Package

# Installation

Depending on architecture, download required SDK libraries from https://thinklucid.com/downloads-hub/ and save them to `./lib`:

* ArenaSDK_v0.1.95_Linux_x64.tar.gz
* ArenaSDK_v0.1.78_Linux_ARM64.tar.gz
* arena_api-2.7.1-py3-none-any.zip

Then, run:

```
make build
make test
```

Or without make:

```
# AMD64
docker build \
    --build-arg LIB_DIR=./lib \
    --build-arg ARENA_SDK_TAR=ArenaSDK_v0.1.95_Linux_x64.tar.gz \
    --build-arg ARENA_SDK_CONF=Arena_SDK_Linux_x64.conf \
    --build-arg ARENA_PYTHON_SDK=arena_api-2.7.1-py3-none-any \
    -t arena .

docker run --network host --rm -it arena \
    /src/arena-sdk/Examples/Arena/Cpp_Acquisition/Cpp_Acquisition
```