#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# use latest homebrew and upgrade already installed formulae
brew update && brew upgrade
# install new casks, formulae etc.
brew bundle install --file="${BASEDIR}/Brewfile"
# remove outdated versions from cellar
brew cleanup
