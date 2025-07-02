FROM ubuntu:24.04

ARG LIB_DIR
ARG ARENA_SDK_TAR
ARG ARENA_SDK_CONF
ARG ARENA_PYTHON_SDK

WORKDIR /src/arena-sdk

RUN apt-get update && apt-get install -y \
    build-essential \
    file \
    g++ \
    make \
    python3-pip \
    sudo \
    unzip

COPY ${LIB_DIR}/${ARENA_SDK_TAR} .

RUN tar --strip-components=1 -xvf ${ARENA_SDK_TAR} \
    && rm ${ARENA_SDK_TAR}

RUN sh /src/arena-sdk/${ARENA_SDK_CONF}

COPY ${LIB_DIR}/${ARENA_PYTHON_SDK}.zip .

RUN unzip ${ARENA_PYTHON_SDK}.zip

RUN pip3 install /src/arena-sdk/${ARENA_PYTHON_SDK}.whl --break-system-packages

RUN cd /src/arena-sdk/Examples/Arena/ && make
