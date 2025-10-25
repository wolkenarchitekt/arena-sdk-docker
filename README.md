# arena-sdk-docker

Dockerfile for Lucid Vision [ArenaSDK](https://thinklucid.com/arena-software-development-kit/).

# Installation

Build:
```
# AMD64
docker build \
    --build-arg ARENA_SDK="ArenaSDK_v0.1.104_Linux_x64.tar.gz" \
    --build-arg ARENA_SDK_URL="https://github.com/wolkenarchitekt/arena-sdk-docker/releases/download/arenasdk-0.1.104-Linux-x64/ArenaSDK_v0.1.104_Linux_x64.tar.gz" \
    --build-arg ARENA_SDK_CONF="Arena_SDK_Linux_x64.conf" \
    -t arena .

# ARM64
docker build \
    --build-arg ARENA_SDK="ArenaSDK_v0.1.78_Linux_ARM64.tar.gz" \
    --build-arg ARENA_SDK_URL="https://github.com/wolkenarchitekt/arena-sdk-docker/releases/download/arenasdk-0.1.104-Linux-arm64/ArenaSDK_v0.1.78_Linux_ARM64.tar.gz" \
    --build-arg ARENA_SDK_CONF="Arena_SDK_ARM64.conf" \
    -t arena .
```

# Run:

```
docker run --network host --rm -it arena \
    /src/arena-sdk/Examples/Arena/Cpp_Acquisition/Cpp_Acquisition
```