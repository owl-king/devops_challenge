#!/bin/bash

# Build docker image
# Local build for mac arm
docker build --build-arg BINARY_URL="https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v1.1.8/energi3-v1.1.8-linux-armv8.tgz" --build-arg CHECKSUM_URL="https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v1.1.8/SHA256SUMS" -t energi3-local .

# Scan security with trivy
trivy image --severity HIGH,CRITICAL energi3-local
