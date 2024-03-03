set -gxp PATH $HOMEBREW_PREFIX/sbin $HOMEBREW_PREFIX/bin /usr/local/sbin /usr/local/bin

# don't show any greetings
set fish_greeting ""

# brew install jump (https://github.com/gsamokovarov/jump)
status --is-interactive; and source (jump shell fish | psub)

eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
