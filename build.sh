#!/bin/bash
set -e

SGXSDK_DIR=$(realpath ../../../install)
GMP_DIR=$(realpath ../install)

if [[ $1 == 'debug' ]]; then
    DEBUG_FLAG=" -O0 -g"
else
    DEBUG_FLAG=" -O2"
fi

mkdir -p build
cd build
../configure --with-trusted-gmpdir=${GMP_DIR} --with-sgxsdk=${SGXSDK_DIR} --enable-sgx-simulation CC=clang-13 CXX=clang++-13 CFLAGS="${DEBUG_FLAG}" CXXFLAGS="${DEBUG_FLAG}"
make -j$(nproc)
