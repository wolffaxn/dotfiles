# ~/.config/zsh/.zshrc

# contains sensitive data which are not pushed to GitHub.
[ -f "$ZDOTDIR/.zshrc.local" ] && source "$ZDOTDIR/.zshrc.local"

if type brew &>/dev/null; then
    if [ "$(arch)" = arm64 ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# set XDG Base Directory Specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

export ASDF_CONFIG_FILE="${ASDF_CONFIG_FILE:=-$HOME/.config/asdf/asdfrc}"
export AWS_CONFIG_FILE="${AWS_CONFIG_FILE:=-$HOME/.config/aws/config}"
export BAT_THEME="Catppuccin-mocha"
export CARGO_HOME="${CARGO_HOME:-$HOME/.config/cargo}"
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export GPG_TTY="$(tty)"
# disable analytics
export HOMEBREW_NO_ANALYTICS=1
# stop brew install from update everything
export HOMEBREW_NO_AUTO_UPDATE=1
# disable annoying hits
export HOMEBREW_NO_ENV_HINTS=1
export MANPAGER="less -X"
export RIPGREP_CONFIG_PATH="${RIPGREP_CONFIG_PATH:-$HOME/.config/ripgrep/ripgreprc}"
export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.config/rustup}"
export STARSHIP_CONFIG="${STARSHIP_CONFIG:-$HOME/.config/starship.toml}"
export VISUAL="nvim"

# fzf specific - https://github.com/junegunn/fzf#key-bindings-for-command-line
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore-vcs"
export FZF_DEFAULT_OPTS="--height 75% --layout=reverse --border"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd --type d . --color=never"

# command history configuration
export HISTFILE=$ZDOTDIR/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=1000000
export SAVEHIST=1000000
# makes the switch between modes quicker
export KEYTIMEOUT=1
export HIST_STAMPS="yyyy-mm-dd"
# enables prefixed search for zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# set language and encoding
export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_ALL=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8

# ensure path arrays do not contain duplicates.
typeset -gU path
# set the list of directories that zsh searches for programs
path=(
  $HOME/.local/bin
  $CARGO_HOME/cargo/bin
  $HOME/go/bin
  $path
)
# export to sub-processes (make it inherited by child processes)
export path

fpath=(
  $HOME/.local/share/zsh/site-functions
  $fpath
)
export fpath

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

source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/function.zsh"

# load and initialize completion
autoload -Uz compinit
compinit

# auto completion
zstyle ":completion:*" file-sort change
zstyle ":completion:*" matcher-list "m:{[:lower:][:upper:]}={[:upper:][:lower:]}" "r:|=*" "l:|=* r:|=*"
zstyle ":completion:*:*:*:*:*" menu select
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" squeeze-slashes true
zstyle ":completion:*" use-cache yes

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh --hook pwd)"
