FROM --platform=$BUILDPLATFORM alpine/git as src
WORKDIR /app

ARG VUETORRENT_REPO=WDaan/VueTorrent
ARG VUETORRENT_REF=v1.8.0

RUN git clone -q \
    --config=advice.detachedHead=false \
    --branch="$VUETORRENT_REF" \
    --depth=1 \
    "https://github.com/$VUETORRENT_REPO.git" .


FROM --platform=$BUILDPLATFORM node:20-alpine as builder
WORKDIR /app

COPY --from=src /app/package*.json .
RUN npm ci

COPY --from=src /app .
RUN npm run build


FROM nginx:stable-alpine
COPY --from=builder /app/vuetorrent/public /usr/share/nginx/html
