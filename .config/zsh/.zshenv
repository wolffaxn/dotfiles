# ~/.config/zsh/.zshenv

if [[ ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

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

export AWS_CONFIG_FILE="${AWS_CONFIG_FILE:=-$HOME/.config/aws/config}"
export CARGO_HOME="${CARGO_HOME:-$HOME/.config/cargo}"
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

# fzf specific - https://github.com/junegunn/fzf#key-bindings-for-command-line
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore-vcs"
export FZF_DEFAULT_OPTS="--height 75% --layout=reverse --border"
export FZF_ALT_C_COMMAND="fd --type d . --color=never"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

export GIT_EDITOR="nvim"

# gnupg
export GNUPGHOME=~/.gnupg

# set the GPG_TTY to be the same as the TTY
if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

# disable analytics
export HOMEBREW_NO_ANALYTICS=1
# stop brew install from update everything
export HOMEBREW_NO_AUTO_UPDATE=1
# disable annoying hits
export HOMEBREW_NO_ENV_HINTS=1

export MANPAGER="less -X"
export RIPGREP_CONFIG_PATH="${RIPGREP_CONFIG_PATH:-$HOME/.config/ripgrep/ripgreprc}"

export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.config/rustup}"
#export RUSTUP_DIST_SERVER=
#export RUSTUP_UPDATE_ROOT=

export STARSHIP_CONFIG="${STARSHIP_CONFIG:-$HOME/.config/starship.toml}"

# vim
export EDITOR="nvim"
export VISUAL="nvim"
