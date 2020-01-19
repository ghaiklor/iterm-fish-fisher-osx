#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure themes and plugins for Fish Shell.
#author         :ghaiklor
#date           :2017-12-11
#version        :0.1
#usage          :curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-fisher-osx/master/install_plugins.sh | fish
#fish_version   :2.7.0
#===================================================================================

fisher add igalic/anicode
fisher add edc/bass
fisher add oh-my-fish/theme-bobthefish
fisher add laughedelic/brew-completions

brew install terminal-notifier
fisher add franciscolourenco/done

fisher add Shadowigor/plugin-errno-grep

brew install fzy
fisher add gyakovlev/fish-fzy

brew install grc
fisher add oh-my-fish/plugin-grc

fisher add oh-my-fish/plugin-node-binpath
fisher add jorgebucaran/fish-nvm

fisher add oh-my-fish/plugin-pj
set -gx PROJECT_PATHS ~/Library/Projects

fisher add Markcial/upto
fisher add jethrokuan/z

fisher self-update
fisher
fish_update_completions
