# ~/.config/zsh/plugins.zsh

ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

_zplugin_load() {
  [[ -z "$1" ]] && { echo "ERROR: No repository specified." >&2; return 1; }

  local plugin_name="${1##*/}"
  local plugin_path="${ZPLUGINDIR}/${plugin_name}"
  
  [[ -d "$ZPLUGINDIR" ]] || mkdir -p "$ZPLUGINDIR"

  if [[ ! -d "$plugin_path" ]]; then
    echo "Installing ${plugin_name}..."
    git clone --depth=1 "https://github.com/${1}" "$plugin_path" 2>/dev/null \
      || { echo "ERROR: failed to install ${plugin_name}" >&2; return 1; }
  fi
        
  local zplugin="${plugin_path}/${plugin_name}.plugin.zsh"
  [[ -f "$zplugin" ]] && source "$zplugin" \
    || { echo "WARNING: ${plugin_name} does not have a ${plugin_name}.plugin.zsh file." >&2; return 1; }
}

zplugin-update() {
  local dir
  [[ -d "$ZPLUGINDIR" ]] || { echo "ERROR: ZPLUGINDIR does not exist." >&2; return 1; }

  for dir in "${ZPLUGINDIR}"/*(/); do
    echo "Updating ${dir:t}..."
    (cd "$dir" && git pull --rebase --quiet 2>/dev/null) \
      || echo "ERROR: failed to update ${dir:t}" >&2
  done
}

# load always first to avoid conflicts with other plugins
_zplugin_load zsh-users/zsh-completions

_zplugin_load zsh-users/zsh-history-substring-search
_zplugin_load zdharma-continuum/fast-syntax-highlighting

# load always last to avoid conflicts with other plugins
_zplugin_load zsh-users/zsh-autosuggestions