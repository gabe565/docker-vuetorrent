# VueTorrent Container Image

<!--renovate repo=WDaan/VueTorrent -->
[![Version](https://img.shields.io/badge/Version-v2.23.1-informational?style=flat)](https://github.com/gabe565/docker-vuetorrent/pkgs/container/vuetorrent)
[![Build](https://github.com/gabe565/docker-vuetorrent/actions/workflows/build.yml/badge.svg)](https://github.com/gabe565/docker-vuetorrent/actions/workflows/build.yml)

This repo builds Docker images for [WDaan/VueTorrent](https://github.com/WDaan/VueTorrent) which can be hosted separately from qBittorrent.

The VueTorrent version is automatically updated by Renovate bot, so new VueTorrent releases will be available within a few hours.

## Images

- [ghcr.io/gabe565/vuetorrent](https://github.com/gabe565/docker-vuetorrent/pkgs/container/vuetorrent)

## Variants
### `<version>`
Default image based on [`nginx`](https://hub.docker.com/_/nginx). Nginx will run as root and listen on port `80`.

### `<version>-nonroot`
Unprivileged image based on [`nginxinc/nginx-unprivileged`](https://hub.docker.com/r/nginxinc/nginx-unprivileged). Nginx will run as UID `101` and listen on port `8080`.

## Deployment

### Docker

See the included [`docker-compose.yml`](docker-compose.yml).
