#!/usr/bin/env bash

export U_S="${U_S:="$CWD"}"

test -n "${LOG:-}" -a -x "${LOG:-}" || export LOG=$U_S/tools/sh/log.sh

: "${hostname:="`hostname -s`"}"

: "${sh_src_base:="/src/sh/lib"}"
: "${sh_util_base:="/tools/sh"}"

: "${SCRIPTPATH:=""}"

. "$script_util/parts/env-std.sh"
. "$script_util/parts/env-ucache.sh"
. "$script_util/parts/env-scriptpath.sh"
