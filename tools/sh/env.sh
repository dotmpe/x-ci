#!/usr/bin/env bash

# Shell env profile script

test -z "${sh_env_:-}" && sh_env_=1 || return 98 # Recursion

: "${CWD:="$PWD"}"
: "${sh_tools:="$CWD/tools/sh"}"

. "$sh_tools/parts/env-strict.sh"

: "${SUITE:="Sh"}"
: "${sh_main_cmdl:="spec"}"
: "${U_S:="$CWD"}"
export scriptname=${scriptname:-"`basename -- "$0"`"}

test -n "${sh_util_:-}" || {

  . "${script_util:="$CWD/tools/sh"}/util.sh"
  . "${script_util}/parts/print-color.sh"
  print_yellow "sh:util" "Loaded util and color printer <$script_util>"
}

test -z "$DEBUG" || print_yellow "" "Starting sh:env '$*' <$0>"

# Keep current shell settings and mute while preparing env, restore at the end
: "${shopts:="$-"}"

: "${gdate:="date"}"

test "$USER" = "travis" && {
  : "${VND_GH_SRC:="$HOME/build"}"
} ||
  : "${VND_GH_SRC:="/src/github.com"}"


: "${U_S:="$VND_GH_SRC/bvberkum/user-scripts"}"

. "${script_util}/parts/env-dev.sh"

test -z "$DEBUG" || print_green "" "Finished sh:env <$0>"

# Sync: U-S:
