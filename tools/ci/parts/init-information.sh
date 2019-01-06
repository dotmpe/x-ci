#!/usr/bin/env bash

export ci_init_ts=$($gdate +"%s.%N")
ci_stages="$ci_stages ci_init"


$LOG note "" "Entry for CI pre-install / init phase"
ci_announce '---------- Finished CI setup'
echo "Terminal: $TERM"
echo "Shell: $SHELL"
echo "Shell-Options: $-"
echo "Shell-Level: $SHLVL"
echo
echo "Travis Branch: $TRAVIS_BRANCH"
echo "Travis Commit: $TRAVIS_COMMIT"
echo "Travis Commit Range: $TRAVIS_COMMIT_RANGE"
echo
echo "Script-Path:"
echo "$SCRIPTPATH" | tr ' ' '\n'
echo "Script-Name: $scriptname"
echo "Verbosity: $verbosity"
echo "Color-Scheme: $CS"
echo "Debug: $DEBUG"
echo
ci_announce '---------- Listing user checkouts'
echo
$LOG note "" "ci/parts/init Done"
ci_announce '---------- Starting build'
# Id: script-mpe/0.0.4-dev tools/ci/parts/init.sh
