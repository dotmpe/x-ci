#!/usr/bin/env bash
# CI suite stage 4. See .travis.yml
set -u
export_stage script && announce_stage

uname=$(uname -s)
uname -s && echo Term $TERM && echo Shell $SHELL

case "$uname" in
    Linux|Darwin ) DOCKER_IMAGE=centurylink/golang-builder-cross ;;
    MSYS_NT-10.0) DOCKER_IMAGE=FIXME # golang:windowsservercore-1803
  ;;
    * ) print_red "No image for $uname"; exit 1
  ;;
esac

docker run --rm \
  -e CGO_ENABLED=true \
  -e COMPRESS_BINARY=true \
  -e BUILD_GOOS="$BUILD_GOOS" \
  -e BUILD_GOARCH="$BUILD_GOARCH" \
  -v "$(pwd -P):/src" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  $DOCKER_IMAGE $APP_ID:local

close_stage && ci_announce "Done"
set +u
# Sync: U-S:
