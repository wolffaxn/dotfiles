# ~/.config/zsh/aliases.zsh

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../.."
alias -- -="cd -"

# reload zsh config
alias zreload="source $ZDOTDIR/.zshrc"

# better cat
alias cat="bat --paging=never"

# clear screen
alias cls="clear"

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

# make some desctructive commands more interactive
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# better ls
alias l="eza -al --icons --group-directories-first"
alias ll="eza -a --icons --group-directories-first"

# httpie
alias https="http --default-scheme=https"

# get week number
alias week="date +%V"

# ansible
alias ans="ansible"
alias anp="ansible-playbook"
alias anv="ansible-vault --ask-vault-pass"
alias ang="ansible-galaxy"

# docker
alias dk="docker"
alias dkps="docker ps -a"
alias dkrm="docker rm (docker ps -a -q)"
alias dkrmi="docker rmi (docker images -q)"
alias dm="docker-machine"
alias dmev="eval (docker-machine env default)"

# git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch -v"
alias gc="git commit"
alias gca="git commit --amend"
alias gcl="git clone"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gdc="git diff --cached"
alias gf="git fetch"
alias gfu="git fetch upstream"
alias gm="git merge --no-ff"
alias gpl="git pull --prune"
alias gp="git push origin HEAD"
alias gpa="git push origin --all"
alias gs="git status -sb"
alias gt="git tag --list"
alias gw="git switch"
alias gwc="git switch -c"

# homebrew
alias brb="brew bundle"
alias brc="brew cleanup"
alias brd="brew doctor"
alias brg="brew upgrade"
alias bri="brew info"
alias brl="brew list"
alias bro="brew outdated"
alias brs="brew search"
alias bru="brew update"

# kubectl
alias k="kubectl"
alias kd="kubectl describe"
alias kdp="kubectl describe po"
alias ke="kubectl edit"
alias kex="kubectl exec -it"
alias kg="kubectl get"
alias kga="kubectl get --all-namespaces"
alias kgp="kubectl get po"
alias krm="kubectl delete"
alias ks="kubectl -n kube-system"
alias kvs="kubectl view-secret"

# terraform
alias tf="terraform"
