#!/bin/bash -e

export ANDROID_HOME="$HOME/Android/Sdk"
export JAVA8_HOME="/usr/lib/jvm/java-8-jdk/"

relativePath="$DOTFILES_LOCATION/programming"

source "$relativePath/javascript.sh"
source "$relativePath/clojure.sh"
source "$relativePath/docker.sh"
source "$relativePath/scala.sh"
source "$relativePath/java.sh"
source "$relativePath/haskell.sh"
source "$relativePath/editors.sh"
source "$relativePath/git-alias.sh"
source "$relativePath/git-completion.bash"
source "$relativePath/git-alias-custom.sh"
source "$relativePath/ssl.sh"

if [ -e /usr/share/autojump/autojump.sh ]; then
  source /usr/share/autojump/autojump.sh
else
  AUTOJUMP_PATH=$(readlink -f "$(which autojump)")
  source "${AUTOJUMP_PATH%bin/*}/etc/profile.d/autojump.sh"
fi
