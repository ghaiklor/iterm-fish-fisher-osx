#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure plugins for Oh My Fish.
#author         :ghaiklor
#date           :2017-12-11
#version        :0.1
#usage          :curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-omf-osx/master/install_plugins.sh | fish
#fish_version   :2.7.0
#===================================================================================

set -e

BREW_DEPENDENCIES=(jq grc thefuck)
OH_MY_FISH_PLUGINS=(spark license battery git-flow await hash errno brew node-binpath grc pj thefuck theme)

brew install ${BREW_DEPENDENCIES[*]}
omf install ${OH_MY_FISH_PLUGINS[*]}
set -gx PROJECT_PATHS ~/Library/Projects
theme bobthefish
