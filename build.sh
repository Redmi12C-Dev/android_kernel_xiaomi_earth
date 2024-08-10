#!/bin/bash
export KBUILD_BUILD_HOST="archlinux"
export KBUILD_BUILD_USER="devbx"
export PATH="$(pwd)/clang/bin:$PATH"
export TZ="Asia/Kuching"

make -j$(nproc --all) O=out ARCH=arm64 earth_defconfig
make -j$(nproc --all) ARCH=arm64 O=out \
                      HOSTCC="ccache clang" \
                      HOSTCXX="ccache clang++" \
                      CC="ccache clang" \
                      LD=ld.lld \
                      AR=llvm-ar \
                      NM=llvm-nm \
                      OBJCOPY=llvm-objcopy \
                      OBJDUMP=llvm-objdump \
                      READELF=llvm-readelf \
                      OBJSIZE=llvm-size \
                      STRIP=llvm-strip \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
		      LTO=full
