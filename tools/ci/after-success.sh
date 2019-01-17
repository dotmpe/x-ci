#!/usr/bin/env bash
# See .travis.yml

set -u
export_stage success && announce_stage

. "$CWD/tools/ci/parts/publish-docker-hub.sh"

close_stage
set +u
# Sync: U-S:
