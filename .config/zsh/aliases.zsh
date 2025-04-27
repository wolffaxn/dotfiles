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
alias ga="git add"
alias gaa="git add --all"
alias gap="git add --patch"
alias gb="git branch"
alias gba="git branch --all"
alias gbm="git branch -m"
alias gbr="git branch --remote"
alias gco="git commit"
alias gca="git commit --amend"
alias gcl="git clone"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gf="git fetch"
alias gfu="git fetch upstream"
alias glo="git log"
alias gm="git merge"
alias gpl="git pull"
alias gps="git push"
alias gpsf="git push --force-with-lease"
alias gpst="git push --tags"
alias gpub="git publish"
alias gpum="git push -u origin main"
alias gpuo="git push -u origin"
alias gra="git remote add"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grbm="git rebase main"
alias gre="git reset"
alias grv="git remote -v"
alias gs="git status"
alias gt="git tag --list"

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
