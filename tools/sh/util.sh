#!/usr/bin/env bash
test -z "${sh_util_:-}" && sh_util_=1 || return 98 # Recursion

info() { exit 123; }

# Print log-like to stderr
print_err()
{
  test -n "$LOG" -a -x "$LOG" && {
    $LOG "$@"; return $?;
  }

  test -z "$verbosity" -a -z "$DEBUG" && return
  test -n "$2" || set -- "$1" "$base" "$3" "$4" "$5"
  test -z "$verbosity" -a -n "$DEBUG" || {

    case "$1" in [0-9]* ) true ;; * ) false ;; esac &&
      lvl=$(log_level_name "$1") ||
      lvl=$(log_level_num "$1")

    test $verbosity -ge $lvl || {
      test -n "$5" && exit $5 || {
        return 0
      }
    }
  }

  printf -- "%s\n" "[$2] $1: $3 <$4> ($5)" >&2
  test -z "$5" || exit $5 # NOTE: also exit on '0'
}

fnmatch() { case "$2" in $1 ) return ;; * ) return 1 ;; esac; }

assert_nonzero()
{
  test $# -gt 0 && test -n "$1"
}

# Sync: U-S:
