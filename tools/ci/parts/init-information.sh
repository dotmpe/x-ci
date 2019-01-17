#!/usr/bin/env bash

export ci_init_ts=$($gdate +"%s.%N")
ci_stages="$ci_stages ci_init"


ci_announce 'Finished CI setup'
echo "Terminal: $TERM"
echo "Shell: $SHELL"
echo "Shell-Options: $-"
echo "Shell-Level: $SHLVL"
echo
echo "Travis Branch: ${TRAVIS_BRANCH:-}"
echo "Travis Commit: ${TRAVIS_COMMIT:-}"
echo "Travis Commit Range: ${TRAVIS_COMMIT_RANGE:-}"
echo
echo "Script-Name: $scriptname"
echo "Verbosity: $verbosity"
echo "Color-Scheme: $CS"
echo "Debug: $DEBUG"
echo "Src-Prefix: $SRC_PREFIX"
echo "Vnd-Src-Prefix: $VND_SRC_PREFIX"
echo "Vnd-Gh-Src: $VND_GH_SRC"
echo "Scm-Vnd: $SCM_VND"
echo "Keep-Going: '$keep_going'"
echo
ci_announce 'Listing user checkouts'
u-s user-repos || true
echo
$LOG note "" "ci/parts/init Done"

ci_announce 'Starting build'
# Sync: BIN:
# Id: script-mpe/0.0.4-dev tools/ci/parts/init.sh
