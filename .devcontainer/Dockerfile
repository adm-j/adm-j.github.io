FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_GB.UTF-8
ENV LANGUAGE=en_GB:en
ENV LC_ALL=en_GB.UTF-8

# ---------------------------------------------------------
# Copy installation scripts
# ---------------------------------------------------------
COPY .devcontainer/scripts/ /tmp/scripts/
RUN chmod +x /tmp/scripts/*.sh

# ---------------------------------------------------------
# System dependencies & Locale (Root)
# ---------------------------------------------------------
RUN /tmp/scripts/install-system-deps.sh

# ---------------------------------------------------------
# Development user
# ---------------------------------------------------------
ARG USERNAME=dev
ARG UID=1000
ARG GID=1000

# Remove default ubuntu user in Ubuntu 24.04 if it exists, then create dev user
RUN if getent passwd ubuntu >/dev/null 2>&1; then userdel -r ubuntu; fi \
    && if getent group ubuntu >/dev/null 2>&1; then groupdel ubuntu; fi \
    && groupadd --gid ${GID} ${USERNAME} \
    && useradd --uid ${UID} --gid ${GID} --create-home --shell /usr/bin/zsh ${USERNAME} \
    && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && mkdir -p /workspace \
    && chown -R ${USERNAME}:${USERNAME} /workspace

# ---------------------------------------------------------
# Switch to development user
# ---------------------------------------------------------
USER ${USERNAME}
WORKDIR /workspace

# Environment variables needed by user tools
ARG PNPM_VERSION=11.22.0
ENV SHELL=/usr/bin/zsh
ENV PNPM_HOME="/home/${USERNAME}/.local/share/pnpm"
ENV PATH="/home/${USERNAME}/.local/share/pnpm/bin:/home/${USERNAME}/.local/share/pnpm:/home/${USERNAME}/.cargo/bin:${PATH}"

# ---------------------------------------------------------
# User tools (pnpm, Node, Zsh plugins)
# ---------------------------------------------------------
RUN /tmp/scripts/install-pnpm.sh "${PNPM_VERSION}"
RUN /tmp/scripts/install-zsh-plugins.sh

# ---------------------------------------------------------
# Zsh configuration
# ---------------------------------------------------------
COPY --chown=${USERNAME}:${USERNAME} \
    .devcontainer/zsh/.zshrc \
    /home/${USERNAME}/.zshrc

COPY --chown=${USERNAME}:${USERNAME} \
    .devcontainer/zsh/.p10k.zsh \
    /home/${USERNAME}/.p10k.zsh

# ---------------------------------------------------------
# Cleanup scripts & finalize
# ---------------------------------------------------------
USER root
RUN rm -rf /tmp/scripts
USER ${USERNAME}

WORKDIR /workspace
CMD ["zsh"]
