# ~/.config/zsh/aliases.zsh

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../.."
alias -- -="cd -"

# better cat
alias cat="bat --paging=never"

# clear screen
alias cls="clear"

# make some desctructive commands more interactive
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# disk free, in gigabytes
alias df="df -h"
# calculates total disk usage for a folder
alias du="du -h -c"
# show sizes in MB
alias free="free -m"

# print the directory structure from the current directory in tree format
alias dirtree="find . -type d|sed -e 's/[^-][^\/]*\//  |/g' -e 's/|\([^ ]\)/|-\1/'"

# enable colors in grep
alias grep="grep --color=auto"

# httpie
alias https="http --default-scheme=https"

# better ls
alias ls="eza --git --group-directories-first --icons"
alias ll="eza -l --git --group-directories-first --icons"
alias lt="eza --git --group-directories-first --icons --tree"

# get week number
alias week="date +%V"

# reload zsh config
alias zreload="source $ZDOTDIR/.zshrc"

alias dotfiles="cd $HOME/.dotfiles"
alias icloud="cd $HOME/Library/Mobile\ Documents"

# lazygit
alias lg="lazygit"
