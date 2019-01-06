#!/usr/bin/env bash
# See .travis.yml

: "${DEBUG:=""}"
: "${CWD:="$PWD"}"

set -euo pipefail

export scriptname=x-ci

ci_cleanup()
{
  echo '------ Exited' >&2
  sleep 2
  sync
}

trap ci_cleanup EXIT

: "${script_util:="$CWD/tools/sh"}"
: "${ci_util:="$CWD/tools/ci"}"

# Get checkouts, tool installs and rebuild env (PATH etc.)
$script_util/parts/init.sh init-deps dependencies.txt

echo "Sourcing env (I)... <${BASH_ENV:-} $CWD $PWD>" >&2
. "${script_util:="$CWD/tools/sh"}/env.sh"
. "${ci_util:="$CWD/tools/ci"}/util.sh"

export_stage before-install before_install && announce_stage

# End with some settings and listings for current env.
. "$ci_util/parts/init-information.sh"

close_stage
set +u
