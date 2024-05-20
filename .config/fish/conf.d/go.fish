# set GOPATH & GOROOT
#set -gx GOPATH "$HOME/.go"
#set -gx GOROOT (brew --prefix golang)"/libexec"
source $HOME/.asdf/plugins/golang/set-env.fish

set -gx PATH $PATH $GOPATH/bin $GOROOT/bin
