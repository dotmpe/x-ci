#!/usr/bin/env bash

# Shell env profile script

test -z "${sh_env_:-}" && sh_env_=1 || return 98 # Recursion

test ${DEBUG:-0} -ne 0 || DEBUG=
: "${CWD:="$PWD"}"

test "${env_strict_-}" = "0" || {
  . "$CWD/tools/sh/parts/env-strict.sh" && env_strict_=$?; }

# FIXME: generate local static env
true "${BIN:="$HOME/bin"}"
test ! -e $BIN/.env.sh || . $BIN/.env.sh
test ! -e $CWD/.htd/meta.sh || . $CWD/.htd/meta.sh

: "${SUITE:="Sh"}"
: "${build_txt:=".build.tab"}" # No-sync
: "${APP_LBL:="Script.mpe"}" # No-Sync
: "${APP_ID:="script-mpe"}" # No-Sync
: "${sh_main_cmdl:="spec"}"
: "${U_S:="/srv/project-local/user-scripts"}" # No-Sync
export scriptname=${scriptname:-"`basename -- "$0"`"}

test -n "${sh_util_:-}" || {

  . "${sh_tools:=$CWD/tools/sh}/util.sh"
}

sh_include print-color remove-dupes unique-paths

suite_source "${build_txt}" "${SUITE}" 0

test -z "${DEBUG:-}" || print_green "" "Finished sh:env ${SUITE} <$0>"

# Sync: U-S:
