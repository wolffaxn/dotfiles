# dotfiles

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/dotfiles/main.svg)](https://github.com/wolffaxn/dotfiles)

Configuration files for MacOS and Linux.

## Install Homebrew

First, install the Xcode Command Line Tools:

```sh
xcode-select --install
sudo xcodebuild -license accept
```

Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Clone dotfiles

Clone dotfiles git repository:

```sh
git clone git@github.com:wolffaxn/dotfiles.git ~/.dotfiles
```

Run stow to install the dotfiles:

```sh
cd ~/.dotfiles
stow . -t ~
```