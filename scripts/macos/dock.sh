#!/usr/bin/env bash
#
# Rearrange dock icons.

set -e

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Finder.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Brave Browser.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/VSCodium.app"
dockutil --no-restart --add "/Applications/Spotify.app"

killall Dock
