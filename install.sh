#!/usr/bin/env bash

set -ex
trap "echo Something went wrong...\nI'm not a specialist in shell scripts, so better to proceed with manual installation then\nhttps://github.com/ghaiklor/iterm-fish-omf-osx" SIGINT SIGTERM

# Fish
brew install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# Oh My Fish
curl -L https://get.oh-my.fish | fish

# Themes
omf install bobthefish

# Plugins
brew install jq grc thefuck
omf install spark license battery git-flow await hash errno brew node-binpath grc pj thefuck
set -gx PROJECT_PATHS ~/Library/Projects
