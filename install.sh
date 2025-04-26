#!/usr/bin/env bash

set -e

echo "Installing dotfiles..."

echo "Installing submodule(s)..."
git submodule update --init --recursive

if [ $(uname) == "Darwin" ]; then
  echo "Running on macOS"

  echo "Installing Xcode cli tools..."
  xcode-select --install

  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
  
  echo "Installing Brew Formulae..."
  source install/macos/brew.sh

  echo "Updating defaults..."
  source install/macos/defaults.sh

  echo "Rearrange dock..."
  source install/macos/dock.sh
fi

echo "Symlink dotfiles..."
stow . -t ~

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
