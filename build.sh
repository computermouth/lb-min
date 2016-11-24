#!/bin/bash

if [[ $(grep "tar \${LIVE_IMAGE_NAME}-\${LIVE_IMAGE_ARCHITECTURE}." /usr/lib/live/build/binary_tar) ]]; then
        sudo sed -s -i 's%tar ${LIVE_IMAGE_NAME}-${LIVE_IMAGE_ARCHITECTURE}.%tar binary%' /usr/lib/live/build/binary_tar
fi

sudo lb build

mv live-image-armhf.tar.tar rootfs.tar
