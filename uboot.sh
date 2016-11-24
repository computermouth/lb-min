#!/bin/bash

set -ex

CHIP_UBOOT_BRANCH=${CHIP_UBOOT_BRANCH:-production-mlc}

git clone https://github.com/nextthingco/chip-u-boot
pushd chip-u-boot

git checkout ${CHIP_UBOOT_BRANCH}

make ${UBOOT_EXTRA_OPTS} ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- CHIP_defconfig
make ${UBOOT_EXTRA_OPTS} ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j8

