#!/usr/bin/env bash

set -eo pipefail

# Appearance
#

# switch to light mode
defaults write -globalDomain AppleInterfaceStyle -string "Light"

killall SystemUIServer 2>/dev/null || true

# Control Center
#

# show bluetooth icon in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 24

killall ControlCenter 2>/dev/null || true

# Finder
#

# show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

killall Finder 2>/dev/null || true

# Keyboard
#

# capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# dash substitution
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# add period with double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# quote substitution
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# auto correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Spotlight
#

# hide menu bar icon
defaults write com.apple.Spotlight MenuItemHidden -int 1

killall Spotlight 2>/dev/null || true

# Hammerspoon config
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
defaults write org.hammerspoon.Hammerspoon MJShowDockIconKey -bool false
defaults write org.hammerspoon.Hammerspoon MJShowMenuIconKey -bool false
defaults write org.hammerspoon.Hammerspoon MJSkipDockMenuIconProblemAlertKey -bool true
