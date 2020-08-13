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
fisher add patrickf3139/colored_man_pages.fish

brew install terminal-notifier
fisher add franciscolourenco/done

fisher add Shadowigor/plugin-errno-grep

brew install fzy
fisher add gyakovlev/fish-fzy

brew install grc
fisher add oh-my-fish/plugin-grc

fisher add vincentjames501/fish-kill-on-port
fisher add oh-my-fish/plugin-node-binpath
fisher add jorgebucaran/nvm.fish

fisher add oh-my-fish/plugin-pj
set -Ux PROJECT_PATHS ~/Library/Projects

fisher add oh-my-fish/plugin-rustup
fisher add markcial/upto

fisher self-update
fisher
fish_update_completions
