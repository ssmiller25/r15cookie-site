ARG ALPINE_VERSION
ARG NGINX_VERSION
FROM alpine:${ALPINE_VERSION} AS builder

# Content below mostly from <https://github.com/jguyomard/docker-hugo/blob/c05479feeafd4eb2f9fc97a94834ac8f05b5a8db/Dockerfile>
#  with some modifications for my site

ARG GIT_HASH
ARG VERSION
ARG RELEASE_DATE
LABEL maintainer="Steve Miller <me@r15cookie.com>"
LABEL version="${VERSION}"
LABEL git_hash="${GIT_HASH}"
LABEL release-date="${RELEASE_DATE}"

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

# Keep Docker build Hugo version aligned with GitHub Actions Pages workflow.
ENV HUGOVERSION 0.131.0
# Resolve the Hugo release arch for wherever this image is built (amd64 or
# arm64). Prefer BuildKit's TARGETARCH and fall back to uname for non-BuildKit
# builders, normalizing the common aliases.
ARG TARGETARCH
RUN HUGO_ARCH="${TARGETARCH:-$(uname -m)}" \
    && case "${HUGO_ARCH}" in \
         x86_64|amd64)  HUGO_ARCH=amd64 ;; \
         aarch64|arm64) HUGO_ARCH=arm64 ;; \
       esac \
    && mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -fL "https://github.com/gohugoio/hugo/releases/download/v${HUGOVERSION}/hugo_extended_${HUGOVERSION}_linux-${HUGO_ARCH}.tar.gz" | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src
COPY . /src
RUN hugo --buildFuture


# Build actual HTML serving directory
FROM nginx:${NGINX_VERSION}
COPY --from=builder /src/public /usr/share/nginx/html
