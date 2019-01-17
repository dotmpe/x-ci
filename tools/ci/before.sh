#!/usr/bin/env bash
# See .travis.yml

set -u
export_stage before-script before && announce_stage

suite_source "build.txt" CI 3

stage_id=before close_stage
set +u
# Sync: U-S:
