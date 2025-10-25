FROM ubuntu:24.04

ARG ARENA_SDK="ArenaSDK_v0.1.104_Linux_x64.tar.gz"
ARG ARENA_SDK_URL="https://github.com/wolkenarchitekt/arena-sdk-docker/releases/download/arenasdk-0.1.104-Linux-x64/${ARENA_SDK}"
ARG ARENA_SDK_CONF="Arena_SDK_Linux_x64.conf"
ARG ARENA_PYTHON_SDK="arena_api-2.7.1-py3-none-any"
ARG ARENA_PYTHON_SDK_URL="https://github.com/wolkenarchitekt/arena-sdk-docker/releases/download/arena_api-2.7.1-py3-none-any/${ARENA_PYTHON_SDK}.zip"

RUN apt-get update && apt-get install -y \
    build-essential \
    file \
    g++ \
    librdmacm-dev \
    libibverbs-dev \
    make \
    python3-pip \
    sudo \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src/arena-sdk

RUN wget --no-clobber "${ARENA_SDK_URL}" \
    && tar --strip-components=1 -xvf "${ARENA_SDK}" \
    && rm "${ARENA_SDK}" 

RUN wget --no-clobber "${ARENA_PYTHON_SDK_URL}" \
    && unzip "${ARENA_PYTHON_SDK}.zip" \
    && pip3 install /src/arena-sdk/${ARENA_PYTHON_SDK}.whl --break-system-packages

RUN sh /src/arena-sdk/${ARENA_SDK_CONF}

RUN cd /src/arena-sdk/Examples/Arena/ && make
