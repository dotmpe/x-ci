#!/usr/bin/env bash
#
# Provisioning and project init helpers

usage()
{
  echo 'Usage:'
  echo '  ./tools/sh/parts/init.sh <function name>'
}
usage-fail() { usage && exit 2; }


init-git()
{
  test -x "$(which git)" || return
  init-git-hooks || return
  init-git-submodules || return
}

init-git-hooks()
{
  test -e .git/hooks/pre-commit || {
    rm .git/hooks/pre-commit || true
    ln -s ../../tools/git/hooks/pre-commit.sh .git/hooks/pre-commit || return
  }
}

init-git-submodules()
{
  test -e .git/modules || {
    git submodule update --init || return
  }
}

check-git()
{
  test -x "$(which git)" || return
  test -h .git/hooks/pre-commit &&
  test -d .git/modules
}

init-deps()
{
  test -d "$VND_GH_SRC" -a -w "$VND_GH_SRC" || return

  test $# -eq 1 || set -- dependencies.txt

  grep -v '^\s*\(#.*\|\s*\)$' "$1" |
  while read installer supportlib version
  do
    $LOG "info" "" "Checking $intaller $supportlib..." "$version"

    : "${version:="master"}"

    ns_name="$(dirname "$supportlib")"
    test -d "$VND_GH_SRC/$ns_name" || mkdir -p "$VND_GH_SRC/$ns_name"

    # Create clone at path, check for Git dir to not be fooled by any cache/mount
    test -e "$VND_GH_SRC/$supportlib/.git" || {

      test ! -e "$VND_GH_SRC/$supportlib" || rm -rf "$VND_GH_SRC/$supportlib"
      git clone --quiet https://github.com/$supportlib "$VND_GH_SRC/$supportlib" || return
    }

    cd "$VND_GH_SRC/$supportlib" && { {
        git fetch --quiet "origin" &&
        git fetch --tags --quiet "origin"
      } || {
        $LOG "error" "$?" "Error retrieving from origin" "$supportlib"
      }
      git reset --quiet --hard origin/$version || {
        $LOG "error" "$?" "Error resetting to $version" "$supportlib"
      }
    }
    $LOG "note" "" "Checked $intaller $supportlib..." "$version"
  done
}

init-symlinks()
{
  false
}


init-err()
{
  $LOG error "" "failed during init" "$*"
  print_red "sh:init" "failed at '$*'" >&2
  exit 1
}


# Groups

default()
{
  # TODO: see +U_s
  true
}


# Main

case "$(basename -- "$0" .sh)" in
  -* ) ;; # No main regardless

  init )
      test "$(basename "$(dirname "$0")")/$(basename "$0")" = parts/init.sh ||
          exit 105 # Sanity

      #. "${sh_tools:="$PWD/tools/sh"}/env.sh"
      : "${CWD:="$PWD"}"
      . "$CWD/tools/sh/parts/env-0-1-lib-sys.sh"
      . "${ci_tools:="$CWD/tools/ci"}/env.sh"
      "$@"
    ;;
esac

# Sync: U-S:
