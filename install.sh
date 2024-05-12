#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE[0]})

function sync() {
  rsync --exclude ".git/" \
        --exclude ".github/" \
        --exclude "scripts/" \
        --exclude ".gitignore" \
        --exclude "install.sh" \
        --exclude "LICENSE" \
        --exclude "README.md" \
        -avh --no-perms . ~
}

sync
unset sync
