# homebrew
if test -d "/opt/homebrew"
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set -gx HOMEBREW_PREFIX "/opt/homebrew";
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
end

# stop brew install from update everything
set -x HOMEBREW_NO_AUTO_UPDATE 1
# disable annoying hits
set -x HOMEBREW_NO_ENV_HINTS 1
