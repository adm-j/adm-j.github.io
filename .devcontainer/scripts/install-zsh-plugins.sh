#!/usr/bin/env bash
set -euo pipefail

ZSH_CUSTOM_DIR="${HOME}/.zsh"
mkdir -p "${ZSH_CUSTOM_DIR}"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM_DIR}/powerlevel10k"

git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git \
    "${ZSH_CUSTOM_DIR}/zsh-autosuggestions"

git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${ZSH_CUSTOM_DIR}/zsh-syntax-highlighting"
