#!/usr/bin/env bash

set -e

# change Hammerspoon's config file location
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
