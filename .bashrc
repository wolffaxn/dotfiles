#!/usr/bin/env bash

if [ "$(arch)" = arm64 ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

eval "$(starship init bash)"

# shellcheck disable=SC1091
source "/opt/homebrew/opt/asdf/libexec/asdf.sh"
