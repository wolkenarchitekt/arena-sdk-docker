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
