#!/usr/bin/env bash

set -eu

PRG_VERSION=$(git describe --tags)
IMAGE_VERSION=${PRG_VERSION}

docker buildx build --platform linux/amd64 --platform linux/arm/v7 --platform linux/arm64 -t "sfudeus/mailrelay:${IMAGE_VERSION}" --push .
