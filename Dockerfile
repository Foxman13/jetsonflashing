# This container downloads and builds the binaries for the specified configuration, optionally flashing a device
# The config is loaded from the specfific device folder
# operations for copying the firmware files should be placed inside firmware.sh

FROM ubuntu:16.04

ARG DEVICE_NAME=default
ARG WORKDIR=/flashing/
WORKDIR ${WORKDIR}

RUN apt-get update && apt-get install -y \
    apt-utils \
    bzip2 \
    zip \
    curl \
    sudo \
    python-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./common/* ${WORKDIR}
COPY ./${DEVICE_NAME}/config.sh ${WORKDIR}
COPY ./${DEVICE_NAME}/apply_firmware.sh ${WORKDIR}

RUN echo ${DEVICE_NAME} && \
    echo ${WORKDIR}

RUN chmod +x *.sh

RUN /bin/bash ./download_packages.sh

RUN /bin/bash ./apply_firmware.sh

RUN /bin/bash ./apply_changes.sh

RUN /bin/bash ./cleanup.sh

ENTRYPOINT [ "bin/bash" ]