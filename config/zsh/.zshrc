# ~/.config/zsh/.zshrc

#
# sourced in interactive shells
#

# uncomment this and the last line for zprof info
#zmodload zsh/zprof

# Contains sensitive data which are not pushed to GitHub.
[ -r $ZDOTDIR/.zshrc.local ] && source $ZDOTDIR/.zshrc.local

export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

#
# Path configuration
#

# ensure path arrays do not contain duplicates.
typeset -gU path

# set the list of directories that zsh searches for programs
path=(
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /usr/local/sbin
  /usr/local/opt/make/libexec/gnubin
  $DOTFILES/bin
  $path
)

# export to sub-processes (make it inherited by child processes)
export path

#
# Exports
#

export EDITOR="nvim"

# set language and encoding
export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_ALL=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8

#
# History
#

# command history configuration
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# allow multiple sessions to append to one zsh command history
setopt append_history
# Save each command’s beginning timestamp and the duration to the history file
setopt extended_history
# when trimming history, lose oldest duplicates first
setopt hist_expire_dups_first
# don't show duplicate history entires
setopt hist_find_no_dups
# ignore duplication command history list
setopt hist_ignore_dups
# remove command line from history list when first character on the line is a space
setopt hist_ignore_space
# remove unnecessary blanks from history
setopt hist_reduce_blanks
# don't execute, just expand history
setopt hist_verify
# append to the history file immediately
setopt inc_append_history
# share history between instances
setopt share_history

# gnupg
export GNUPGHOME="${GNUPGHOME:-$HOME/.config/gnupg}"

# rust
export CARGO_HOME="${CARGO_HOME:-$HOME/.config/cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.config/rustup}"

#
# Prompt
#

# init starship cross-shell prompt
eval "$(starship init zsh)"

if command -v brew > /dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# enable completion
autoload -Uz compinit
compinit

autoload bashcompinit
bashcompinit

zmodload -i zsh/complist

# use vim-like key bindings by default:
bindkey -v
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward

if command -v antibody > /dev/null; then
    if [[ ! -e "$ZDOTDIR/.zsh_plugins.sh" ]]; then
        antibody bundle < "$ZDOTDIR/.antibody_bundle" > "$ZDOTDIR/.zsh_plugins.sh"
    fi

    # load antibody plugins
    source $ZDOTDIR/.zsh_plugins.sh
fi

#zprof