#!/usr/bin/env bash

# Shell env profile script

test -z "${sh_env_:-}" && sh_env_=1 || return 98 # Recursion

: "${CWD:="$PWD"}"
: "${sh_tools:="$CWD/tools/sh"}"

. "$U_S/tools/sh/parts/env-strict.sh"

: "${ci_tools:="$CWD/tools/ci"}"
: "${build_tab:=".build.tab"}"
: "${U_S:="$CWD/vnd/bvberkum/user-scripts"}"

: "${SUITE:="Sh"}"
: "${init_sh_boot:=0}"
: "${sh_main_cmdl:="spec sh-baseline.tab"}"
export scriptname=${scriptname:-"`basename -- "$0"`"}

SCRIPTPATH=

test -n "${sh_util_:-}" || {

  test "$SUITE" != "CI" || {
    test -d $U_S/.git || {
    #  rm -rf $U_S || true
      git clone https://github.com/bvberkum/user-scripts $U_S
    }
    #(
    #  cd $U_S && git fetch --all && git reset --hard origin/feature/docker-ci
    #)
  }

  . "$sh_tools/util.sh"
}

test -z "${DEBUG:-}" -a -z "${CI:-}" ||
  print_yellow "${SUITE} Env parts" "$(suite_from_table "${build_tab}" "Parts" "${SUITE}" 0|tr '\n' ' ')" >&2

suite_source "${build_tab}" "${SUITE}" 0

test -z "$DEBUG" || print_green "" "Finished sh:env ${SUITE} <$0>"

# Copy: U-S:
