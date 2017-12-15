#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure themes and plugins for Oh My Fish.
#author         :ghaiklor
#date           :2017-12-11
#version        :0.1
#usage          :curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-fisherman-osx/master/install_plugins.sh | fish
#fish_version   :2.7.0
#===================================================================================

fisher anicode
fisher await
fisher edc/bass
fisher omf/battery
fisher omf/theme-bobthefish
fisher laughedelic/brew-completions

brew install terminal-notifier
fisher done

fisher Shadowigor/plugin-errno-grep

brew install fzy
fisher fzy

brew install grc
fisher omf/grc

brew install jq
fisher omf/license

fisher omf/node-binpath
fisher laughedelic/pisces

fisher omf/pj
set -U PROJECT_PATHS ~/Library/Projects

fisher shark

fisher omf/thefuck
brew install thefuck

fisher upto
fisher z

fisher up
fish_update_completions
