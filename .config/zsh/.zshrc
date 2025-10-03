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

# Navigation
# ----------

# navigate to directory by name without using cd
setopt AUTO_CD
# automatically push directories to the stack when cd'ing
setopt AUTO_PUSHD
# don't store duplicates on the stack
setopt PUSHD_IGNORE_DUPS
# swap the meaning of cd +1 and cd -1
setopt PUSHD_MINUS
# don't print the directory stack when pushing or popping
setopt PUSHD_SILENT

# History
# ----------

# default location for history file
export HISTFILE=$ZDOTDIR/.zsh_history

# define history size 
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

# change the command execution time stamp shown in the history command output
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
export HIST_STAMPS="yyyy-mm-dd"

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

# Completion
# ----------

# complete from both ends of a word
setopt COMPLETE_IN_WORD
# don't require a leading . to match hidden files
setopt GLOB_DOTS

# this is faster than `autoload -U compinit && compinit`
autoload -Uz compinit

# should be called before compinit
zmodload -i zsh/complist

zcompdump_current() {
  if [[ $(uname -s) == "Darwin" ]]; then
    [ "$(date +'%s')" != "$(stat -f '%Y' -t '%j' $ZDOTDIR/.zcompdump)" ];
  else
    [ "$(date +'%s')" != "$(stat -c '%Y' $ZDOTDIR/.zcompdump)" ];
  fi
}

if zcompdump_current; then
  compinit
else
  compinit -C
fi

# Key Bindings
# ----------

# use vi mode
bindkey -v

# makes the switch between vi modes faster 
export KEYTIMEOUT=1

# better searching in command mode
bindkey -M vicmd "?" history-incremental-search-backward
bindkey -M vicmd "/" history-incremental-search-forward

# beginning search with arrow keys in insert mode or k/j command mode
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# use vim keys (hjkl) in menu selection
zmodload zsh/complist
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char

# Completion Style
# ----------

# suggest aliases like regular commands
zstyle ":completion:*" complete true
# sort files by modification date
zstyle ":completion:*" file-sort modification
# display a completion menu when any tags are available for the current completion
zstyle ":completion:*" menu select
#
zstyle ":completion:*" special-dirs true
#
zstyle ":completion:*" squeeze-slashes true
# use cache so that slow commands are useable
zstyle ":completion:*" use-cache yes
# show more verbose suggestion output
zstyle ":completion:*" verbose yes

# Custom
# ----------

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/function.zsh"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# set SSH_AUTH_SOCK so that SSH will use gpg-agent instead of ssh-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY="${TTY:-"$(tty)"}"
gpg-connect-agent updatestartuptty /bye >/dev/null

# GitHub CLI completion
if command -v gh &>/dev/null; then
  eval "$(gh completion -s zsh)"
fi

# Direnv
if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# fzf
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# Starship
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# Zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh --hook pwd)"
fi
