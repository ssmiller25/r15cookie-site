FROM mcr.microsoft.com/devcontainers/base:bookworm

ARG BUILDARCH
ARG HUGO_VERSION=0.131.0
ARG UV_VERSION=0.4.17

# Install system dependencies
RUN sudo apt-get update && \
    sudo apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    python3-venv \
    && sudo rm -rf /var/lib/apt/lists/*

# Install uv for Python package management
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    sudo mv /root/.local/bin/uv /usr/local/bin/uv

# Install Hugo for Github Releases Page
RUN mkdir -p /tmp/hugo && \
    cd /tmp/hugo && \
    curl -LO  https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-${BUILDARCH}.deb && \
    sudo apt install ./hugo_${HUGO_VERSION}_linux-${BUILDARCH}.deb && \
    cd / && \
    rm -rf /tmp/hugo


