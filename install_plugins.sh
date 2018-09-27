#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure themes and plugins for Fish Shell.
#author         :ghaiklor
#date           :2017-12-11
#version        :0.1
#usage          :curl -s https://raw.githubusercontent.com/rgaidot/iterm-fish-fisherman-osx/master/install_plugins.sh | fish
#fish_version   :2.7.0
#===================================================================================

fisher anicode
fisher await
fisher edc/bass
fisher omf/battery
fisher omf/theme-bobthefish
fisher laughedelic/brew-completions

brew install bat

brew install httpie

brew install htop

brew install diff-so-fancy

brew install terminal-notifier
fisher done

fisher Shadowigor/plugin-errno-grep

brew install fd

brew install fzy
fisher fzy

brew install fzf
fisher fzf

brew install grc
fisher omf/grc

brew install jq
fisher omf/license

brew install ncdu

fisher omf/node-binpath

fisher omf/pj
set -U PROJECT_PATHS ~/Library/Projects

fisher shark

fisher upto
fisher z

fisher up
fish_update_completions
