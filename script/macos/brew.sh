#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# use latest homebrew and upgrade already installed formulae
brew update
brew bundle install --cleanup --file="${BASEDIR}/Brewfile"
brew upgrade
brew cleanup