#!/usr/bin/env bash

set -e

# use latest homebrew and upgrade already installed formulae
brew update && brew upgrade
# install new casks, formulae etc.
brew bundle install --file=./Brewfile
# remove outdated versions from cellar
brew cleanup
