#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure themes and plugins for Oh My Fish.
#author         :ghaiklor
#date           :2017-12-11
#version        :0.1
#usage          :curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-omf-osx/master/install_plugins.sh | fish
#fish_version   :2.7.0
#===================================================================================

# Theme Configuration
brew install --with-default-names gnu-sed
set -U fish_key_bindings fish_vi_key_bindings
fish_update_completions
omf install budspencer

# Plugins Configuration
brew install jq grc thefuck
omf install spark license battery git-flow await hash errno brew node-binpath grc pj thefuck
set -gx PROJECT_PATHS ~/Library/Projects
