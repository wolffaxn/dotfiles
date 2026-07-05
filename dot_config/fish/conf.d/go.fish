# set GOPATH & GOROOT
set -gx GOPATH "$HOME/.go"
set -gx GOROOT (brew --prefix golang)"/libexec"

set -gx PATH $PATH $GOPATH/bin $GOROOT/bin
