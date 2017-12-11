#!/usr/bin/env fish
#title          :install_plugins.sh
#description    :This script will install and configure themes and plugins for Oh My Fish.
#author         :ghaiklor
#date           :2017-12-11
#version        :0.1
#usage          :curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-omf-osx/master/install_plugins.sh | fish
#fish_version   :2.7.0
#===================================================================================

# Plugins Configuration
brew install jq thefuck
omf install spark license battery await errno brew node-binpath pj thefuck
set -U PROJECT_PATHS ~/Library/Projects

# Theme Configuration
omf install bobthefish
set -U theme_title_display_process yes
set -U theme_title_display_path yes
set -U theme_title_display_user yes
set -U theme_title_use_abbreviated_path yes
set -U theme_display_ruby no
set -U theme_display_git yes
set -U theme_display_git_untracked yes
set -U theme_display_git_ahead_verbose yes
set -U theme_display_cmd_duration yes
set -U theme_show_exit_status yes
set -U theme_git_worktree_support no
set -U theme_color_scheme dark
fish_update_completions
