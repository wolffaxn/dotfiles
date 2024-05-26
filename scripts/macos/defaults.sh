#!/usr/bin/env bash

set -e

DEFAULTS=/usr/bin/defaults

# Hammerspoon config
$DEFAULTS write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
$DEFAULTS write org.hammerspoon.Hammerspoon MJShowDockIconKey -bool false
$DEFAULTS write org.hammerspoon.Hammerspoon MJShowMenuIconKey -bool false
$DEFAULTS write org.hammerspoon.Hammerspoon MJSkipDockMenuIconProblemAlertKey -bool true
