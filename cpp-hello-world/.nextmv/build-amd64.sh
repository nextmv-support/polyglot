#!/bin/bash

# Build Linux AMD64 binary using Docker
docker run --rm -v $(pwd):/workspace -w /workspace --platform linux/amd64 ubuntu:22.04 bash -c "
  apt-get update && apt-get install -y build-essential cmake && \
  mkdir -p build/linux-amd64 && cd build/linux-amd64 && \
  cmake ../.. && make
"

# Copy main binary to app root (preparing for nextmv app packaging)
cp -v build/linux-amd64/stress_test main
