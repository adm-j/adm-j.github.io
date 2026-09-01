#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    wget \
    git \
    file \
    pkg-config \
    libssl-dev \
    xdg-utils \
    sudo \
    zsh \
    locales \
    unzip \
    nano

# Generate locale
locale-gen en_GB.UTF-8

# Clean up apt caches
apt-get clean
rm -rf /var/lib/apt/lists/*
