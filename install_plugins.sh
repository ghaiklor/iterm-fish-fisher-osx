#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure themes and plugins for Fish Shell.
#author         :ghaiklor
#date           :2017-12-11
#version        :0.1
#usage          :curl -s https://raw.githubusercontent.com/rgaidot/iterm-fish-fisherman-osx/master/install_plugins.sh | fish
#fish_version   :2.7.0
#===================================================================================

fisher add anicode
fisher add await
fisher add edc/bass
fisher add omf/battery
fisher add omf/theme-bobthefish
fisher add laughedelic/brew-completions

brew install bat

brew install httpie

brew install htop

brew install diff-so-fancy

brew install terminal-notifier
fisher add done

brew install tmate

fisher add Shadowigor/plugin-errno-grep

brew install fd

brew install fzy
fisher add fzy

brew install fzf
fisher add fzf

brew install fx

brew install grc
fisher add omf/grc

brew install jq
fisher add omf/license

brew install ncdu

fisher add omf/node-binpath

fisher add omf/pj
set -U PROJECT_PATHS ~/Library/Projects

fisher add shark

brew install vault

fisher add upto
fisher add z

fisher add up
fish_update_completions
