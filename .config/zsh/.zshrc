# ~/.config/zsh/.zshrc

# contains sensitive data which are not pushed to GitHub.
[ -f "$ZDOTDIR/.zshrc.local" ] && source "$ZDOTDIR/.zshrc.local"

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

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/function.zsh"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh --hook pwd)"
