# ~/.config/zsh/fzf.zsh

# fzf specific - https://github.com/junegunn/fzf#key-bindings-for-command-line
export FZF_DEFAULT_COMMAND="fd --type f --hidden --strip-cwd-prefix"
export FZF_DEFAULT_OPTS="
  --border=rounded
  --height=75%
  --layout=reverse
  --pointer='  '
  --preview-window=right:65%:wrap:border-left
  --prompt='  '
"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS --color=never --hidden"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
export FZF_TMUX="1"
export FZF_TMUX_OPTS="-p"

# Ctrl+F: file picker excluding hidden files
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
