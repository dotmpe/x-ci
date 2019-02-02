#!/usr/bin/env bash

case "$uname" in
    linux|darwin )
        DOCKER_IMAGE=centurylink/golang-builder-cross ;;
    #msys_nt-10.0)
    #    DOCKER_IMAGE=FIXME # golang:windowsservercore-1803
    #  ;;
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

# Id: X-CI-0.1:
