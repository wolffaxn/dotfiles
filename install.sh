#!/usr/bin/env bash

set -e

echo "Installing dotfiles"

echo "Installing submodule(s)"
git submodule update --init --recursive

if [ $(uname) == "Darwin" ]; then
  echo "Running on macOS"

  echo "Brewing packages"
  source install/macos/brew.sh

  echo "Updating defaults"
  source install/macos/defaults.sh
fi

echo "Symlink dotfiles"
stow . -t ~

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
