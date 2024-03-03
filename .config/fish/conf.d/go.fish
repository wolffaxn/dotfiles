set -gx GOPATH "$HOME/.go"
set -gx GOROOT (brew --prefix golang)"/libexec"
set -gx PATH $PATH $GOPATH/bin $GOROOT/bin
test -d "$GOPATH" || mkdir "$GOPATH"
test -d "$GOPATH/src/github.com" || mkdir -p "$GOPATH/src/github.com"
