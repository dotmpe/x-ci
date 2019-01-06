#!/usr/bin/env bash

# Shell env profile script

test -z "${sh_env_:-}" && sh_env_=1 || return 98 # Recursion


: "${DEBUG:=""}"
: "${CWD:="$PWD"}"
LOG=echo

export scriptname=${scriptname:-"`basename "$0"`"}

test -n "${sh_util_:-}" || {

  . "${script_util:="$CWD/tools/sh"}/util.sh"
  . "${script_util:="$CWD/tools/sh"}/parts/print-color.sh"
  print_yellow "sh:util" "Loaded"
}

test -z "$DEBUG" || print_yellow "" "Starting sh:env '$_' '$*' <$0>"

: "${gdate:="date"}"

test "$USER" = "travis" && {
  : "${VND_GH_SRC:="$HOME/build"}"
} ||
  : "${VND_GH_SRC:="/src/github.com"}"


: "${U_S:="$VND_GH_SRC/bvberkum/user-scripts"}"

. "${script_util}/parts/env-dev.sh"

test -z "$DEBUG" || print_green "" "Finished sh:env"
