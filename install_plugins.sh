#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure themes and plugins for Fish Shell
#author         :ghaiklor
#date           :2021-06-20
#version        :1.0
#usage          :curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-fisher-osx/master/install_plugins.sh | fish
#fish_version   :3.2.2
#===================================================================================

curl --silent --location https://git.io/fisher | source
brew install terminal-notifier grc

fisher install jorgebucaran/fisher
fisher install edc/bass
fisher install oh-my-fish/theme-bobthefish
fisher install patrickf1/colored_man_pages.fish
fisher install franciscolourenco/done
fisher install oh-my-fish/plugin-grc
fisher install jorgebucaran/nvm.fish
fisher install oh-my-fish/plugin-pj
fisher install markcial/upto

set --universal --export theme_nerd_fonts yes
set --universal --export theme_color_scheme zenburn
set --universal --export PROJECT_PATHS ~/Library/Projects

fish_update_completions
