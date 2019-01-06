#!/usr/bin/env bash
# See .travis.yml


export_stage script && announce_stage
uname -s && echo Term $TERM && echo Shell $SHELL
cat /etc/os-release
case "$(uname -s)" in
    Linux|Darwin ) DOCKER_IMAGE=centurylink/golang-builder-cross ;;
    MSYS_NT-10.0) DOCKER_IMAGE=FIXME # golang:windowsservercore-1803
  ;;
esac
docker run --rm
-e CGO_ENABLED=true
-e COMPRESS_BINARY=true
-e BUILD_GOOS="$BUILD_GOOS"
-e BUILD_GOARCH="$BUILD_GOARCH"
-v "$(pwd -P):/src"
-v /var/run/docker.sock:/var/run/docker.sock
$DOCKER_IMAGE $APP_ID:local

close_stage && ci_announce "Done"
