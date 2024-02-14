# homebrew
if test -d "/opt/homebrew"
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set -gx HOMEBREW_PREFIX "/opt/homebrew";
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
end

set -gxp PATH $HOMEBREW_PREFIX/sbin $HOMEBREW_PREFIX/bin /usr/local/sbin /usr/local/bin
set -gxp CARGO_HOME "$HOME/.config/cargo"
set -gxp RUSTUP_HOME "$HOME/.config/rustup"

set -gx EDITOR nvim
set -gx GPG_TTY (tty)

# don't show any greetings
set fish_greeting ""

# brew install jump (https://github.com/gsamokovarov/jump)
status --is-interactive; and source (jump shell fish | psub)

eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

# starship
starship init fish | source
