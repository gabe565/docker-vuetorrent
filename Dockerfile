ARG VARIANT=default

FROM --platform=$BUILDPLATFORM alpine:3.21 AS src
WORKDIR /app

ARG VUETORRENT_REPO=WDaan/VueTorrent
ARG VUETORRENT_REF=v2.23.1

RUN <<EOT
  set -eux
  wget "https://github.com/$VUETORRENT_REPO/releases/download/$VUETORRENT_REF/vuetorrent.zip"
  unzip vuetorrent.zip
  rm vuetorrent.zip
EOT

FROM nginx:stable-alpine AS variant-default
FROM nginxinc/nginx-unprivileged:stable-alpine AS variant-nonroot

FROM variant-$VARIANT
COPY --from=src /app/vuetorrent/public /usr/share/nginx/html
