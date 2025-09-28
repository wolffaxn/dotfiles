# ~/.config/zsh/.zshenv

if [[ ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export KEYTIMEOUT="1"

if command -v nvim >/dev/null 2>&1; then
  export EDITOR="nvim"
  export GIT_EDITOR=$EDITOR
  export VISUAL=$EDITOR
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
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_VIDEOS_DIR="$HOME/Videos"

export AWS_CONFIG_FILE="${AWS_CONFIG_FILE:=-$HOME/.config/aws/config}"
export CARGO_HOME="${CARGO_HOME:-$HOME/.config/cargo}"
export CURL_HOME="${CURL_HOME:-$HOME/.config/curl}"
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

# fd
FD_OPTIONS="--follow --exclude .git"

# fzf specific - https://github.com/junegunn/fzf#key-bindings-for-command-line
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS --color=never --hidden"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
export FZF_CTRL_R_OPTS="--reverse"
export FZF_CTRL_T_COMMAND="git ls-files --cached --others --exclude-standard | fd --hidden --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --hidden --type f --type l $FD_OPTIONS"export FZF_DEFAULT_OPTS="--height 75% --layout=reverse --border"
export FZF_TMUX="1"
export FZF_TMUX_OPTS="-p"

# gnupg
export GNUPGHOME=~/.gnupg

# set the GPG_TTY to be the same as the TTY
if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

# set app directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# disable analytics
export HOMEBREW_NO_ANALYTICS=1
# disable auto update when running brew command
export HOMEBREW_NO_AUTO_UPDATE=1
# disable annoying hits
export HOMEBREW_NO_ENV_HINTS=1

# set language and encoding
export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_ALL=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8

# Man
export MANPATH="/usr/local/man:$MANPATH"
# dont't clear the screen after quitting a man page
export MANPAGER="less -X"

# ripgrep
export RIPGREP_CONFIG_PATH="${RIPGREP_CONFIG_PATH:-$HOME/.config/ripgrep/ripgreprc}"

# Rust
export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.config/rustup}"#export RUSTUP_DIST_SERVER=

# Starship
export STARSHIP_CONFIG="${STARSHIP_CONFIG:-$HOME/.config/starship.toml}"
