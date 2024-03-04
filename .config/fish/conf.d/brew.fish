if test (uname) != Darwin
    exit
end

if test -d /opt/homebrew
    /opt/homebrew/bin/brew shellenv | source
end

# stop brew install from update everything
set -x HOMEBREW_NO_AUTO_UPDATE 1
# disable annoying hits
set -x HOMEBREW_NO_ENV_HINTS 1