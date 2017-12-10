#!/usr/bin/env bash
#title          :install.sh
#description    :This script will install and configure Fish Shell + Oh My Fish.
#author         :ghaiklor
#date           :2017-12-10
#version        :0.1
#usage          :bash install.sh
#bash_version   :3.2.57(1)-release
#===================================================================================

set -e
trap on_sigterm SIGINT SIGTERM

TEMP_DIR=$(mktemp -d)
HOMEBREW_INSTALLER_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"
RESET_COLOR="\033[0m"
RED_COLOR="\033[0;31m"
GREEN_COLOR="\033[0;32m"
BLUE_COLOR="\033[0;34m"

function reset_color() {
    echo -e "${RESET_COLOR}\c"
}

function red_color() {
    echo -e "${RED_COLOR}\c"
}

function green_color() {
    echo -e "${GREEN_COLOR}\c"
}

function blue_color() {
    echo -e "${BLUE_COLOR}\c"
}

function hello() {
    green_color
    echo "                                              "
    echo "    _____      __            __         ____  "
    echo "   / __(_)____/ /_     _____/ /_  ___  / / /  "
    echo "  / /_/ / ___/ __ \   / ___/ __ \/ _ \/ / /   "
    echo " / __/ (__  ) / / /  (__  ) / / /  __/ / /    "
    echo "/_/ /_/____/_/ /_/  /____/_/ /_/\___/_/_/     "
    echo "                                              "
    echo "          iTerm + Fish + Oh My Fish           "
    echo "                                              "
    echo "                                              "

    blue_color
    echo "This script will guide you through installer of Fish + Oh My Fish and useful plugins"
    echo "It can ask you for the sudo password few times, but do not afraid"
    echo "I need sudo just for setting up fish as default shell and adding it into /etc/shells"

    green_color
    read -p "Do you want to proceed with installation? (y/N) " -n 1 answer
    if [ ${answer} != "y" ]; then
        exit 1
    fi

    reset_color
}

function install_command_line_tools() {
    blue_color
    echo "Trying to detect installed Command Line Tools..."

    if ! [ -d $(xcode-select -p) ]; then
        blue_color
        echo "You don't have Command Line Tools installed"

        green_color
        read -p "Do you agree to proceed with its installation? (y/N) " -n 1 answer
        if [ ${answer} != "y" ]; then
            exit 1
        fi

        blue_color
        echo "Installing Command Line Tools..."

        xcode-select --install

        green_color
        echo "Command Line Tools installed!"
        sleep 1
    else
        blue_color
        echo "Seems like you have installed Command Line Tools, so skipping..."
    fi

    reset_color
}

function install_homebrew() {
    blue_color
    echo "Trying to detect installed Homebrew..."

    if ! [ -x $(command -v brew) ]; then
        blue_color
        echo "Seems like you don't have Homebrew installed"
        echo "We need it for completing the installation of your awesome terminal environment"

        green_color
        read -p "Do you agree to proceed with Homebrew installation? (y/N) " -n 1 answer
        if [ ${answer} != "y" ]; then
            exit 1
        fi

        blue_color
        echo "Installing Homebrew..."

        ruby -e "$(curl -fsSL ${HOMEBREW_INSTALLER_URL})"
        brew update
        brew upgrade

        green_color
        echo "Homebrew installed!"
        sleep 1
    else
        blue_color
        echo "You already have Homebrew installed, so skipping..."
    fi

    reset_color
}

function install_fish() {
    blue_color
    echo "Trying to detect installed Fish Shell..."

    if ! [ -x $(command -v fish) ]; then
        blue_color
        echo "Seems like you don't have Fish Shell installed"

        green_color
        read -p "Do you agree to install it? (y/N) " -n 1 answer
        if [ ${answer} != "y" ]; then
            exit 1
        fi

        blue_color
        echo "Installing Fish Shell..."
        echo "The script will ask you the password for sudo 2 times:"
        echo
        echo "1) When adding fish shell into /etc/shells via tee"
        echo "2) When changing your default shell via chsh -s"

        brew install fish
    else
        blue_color
        echo "You already have Fish Shell installed"
        echo "Just to be sure, that this is your default shell..."
    fi

    echo "$(command -v fish)" | sudo tee -a /etc/shells
    chsh -s $(command -v fish)

    green_color
    echo "Fish installed!"
    sleep 1

    reset_color
}

function install_omf() {
    green_color
    read -p "Do you agree to install Oh My Fish? (y/N) " -n 1 answer
    if [ ${answer} != "y" ]; then
        exit 1
    fi

    blue_color
    echo "Installing Oh My Fish..."

    curl -L https://get.oh-my.fish | fish

    green_color
    echo "Oh My Fish installed!"
    sleep 1

    reset_color
}

function install_omf_plugins_and_themes() {
    blue_color
    echo "Some of the Oh My Fish plugins requires external dependencies to be installed via Homebrew..."

    green_color
    read -p "Do you agree to install them? (y/N) " -n 1 answer
    if [ ${answer} != "y" ]; then
        exit 1
    fi

    blue_color
    echo "Installing Themes and Plugins..."

    brew install jq grc thefuck
    omf install spark license battery git-flow await hash errno brew node-binpath grc pj thefuck theme
    set -gx PROJECT_PATHS ~/Library/Projects
    theme --download-all
    theme bobthefish

    green_color
    echo "Themes and Plugins installed!"
    sleep 1
}

function on_sigterm() {
    red_color
    echo -e "Wow... Something serious happened!"
    echo -e "Though, I don't know what really happened :("
    echo -e "Please, refer to manual installation -> ${BLUE_COLOR}https://github.com/ghaiklor/iterm-fish-omf-osx${RED_COLOR}"
    echo -e "In case, you want to help me fix this problem, raise an issue -> ${BLUE_COLOR}https://github.com/ghaiklor/iterm-fish-omf-osx/issues/new"

    reset_color
    exit 1
}

hello
install_command_line_tools
install_homebrew
install_fish
install_omf
install_omf_plugins_and_themes
