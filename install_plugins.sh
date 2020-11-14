#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure themes and plugins for Fish Shell.
#author         :ghaiklor
#date           :2017-12-11
#version        :0.1
#usage          :curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-fisher-osx/master/install_plugins.sh | fish
#fish_version   :2.7.0
#===================================================================================

fisher install igalic/anicode
fisher install edc/bass
fisher install oh-my-fish/theme-bobthefish
fisher install laughedelic/brew-completions
fisher install patrickf3139/colored_man_pages.fish

brew install terminal-notifier
fisher install franciscolourenco/done

fisher install Shadowigor/plugin-errno-grep

brew install fzy
fisher install gyakovlev/fish-fzy

brew install grc
fisher install oh-my-fish/plugin-grc

fisher install vincentjames501/fish-kill-on-port
fisher install oh-my-fish/plugin-node-binpath
fisher install jorgebucaran/nvm.fish

fisher install oh-my-fish/plugin-pj
set -Ux PROJECT_PATHS ~/Library/Projects

fisher install oh-my-fish/plugin-rustup
fisher install markcial/upto

fish_update_completions
