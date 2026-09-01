#!/usr/bin/env bash
set -euo pipefail

PNPM_VERSION="${1:-11.22.0}"
export PNPM_HOME="${HOME}/.local/share/pnpm"
export PATH="${PNPM_HOME}/bin:${PNPM_HOME}:${PATH}"

# Install pnpm standalone binary
curl -fsSL https://get.pnpm.io/install.sh | \
    ENV="/dev/null" \
    SHELL="/usr/bin/zsh" \
    PNPM_VERSION="${PNPM_VERSION}" \
    sh -

# Install and activate Node.js 22 globally via pnpm
pnpm runtime set node 22 --global