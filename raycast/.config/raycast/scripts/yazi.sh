#!/bin/zsh

# @raycast.schemaVersion 1
# @raycast.title Yazi
# @raycast.mode fullOutput
#
# @raycast.icon 

open -na Ghostty.app --args -e yazi "$@" --cwd-file="$(mktemp -t "yazi-cwd.XXXXXX")"

