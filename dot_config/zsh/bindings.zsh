# ~/.config/zsh/bindings.zsh

#
# Key Bindings
#

# Use vi mode
bindkey -v

# Makes the switch between vi modes faster (reduces escape key delay)
export KEYTIMEOUT=1

# Better searching in command mode using standard vim slash/question mark
bindkey -M vicmd "?" history-incremental-search-backward
bindkey -M vicmd "/" history-incremental-search-forward

# Beginning search with arrow keys in insert mode or k/j command mode
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Use vim keys (hjkl) in menu selection
zmodload zsh/complist
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char

#
# FZF, Atuin & Custom Widget Bindings for Vi-Mode
#

# Bind custom FZF function (exclude hidden files) to Ctrl+F
# Makes it available in both Vi-Insert and Vi-Command modes
bindkey -M viins "^F" _fzf_file_no_hidden
bindkey -M vicmd "^F" _fzf_file_no_hidden

# Fix standard FZF keybindings for Vi-Insert mode
# Ensures Ctrl+T (file search) and Alt+C (change directory) work while typing
bindkey -M viins "^T" fzf-file-widget
bindkey -M viins "^[c" fzf-cd-widget

# Fix Atuin history search for Ctrl+R in Vi-Insert mode
# Prevents the vi-mode from blocking the Atuin history overlay
bindkey -M viins "^R" _atuin_search_widget