#!/usr/bin/env bash
#title          :install.sh
#description    :This script will install and configure Fish Shell + Fisherman.
#author         :ghaiklor / rgaidot
#date           :2020-01-22
#version        :0.1
#usage          :bash <(curl -s https://raw.githubusercontent.com/rgaidot/iterm-fish-fisherman-osx/master/install.sh)
#bash_version   :3.2.57(1)-release
#===================================================================================

set -e
trap on_sigterm SIGKILL SIGTERM

TEMP_DIR=$(mktemp -d)
GITHUB_REPO_URL_BASE="https://github.com/rgaidot/iterm-fish-fisherman-osx/"
HOMEBREW_INSTALLER_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"
COLOR_SCHEME_URL="https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M-DZ/Regular/complete/Meslo%20LG%20M%20DZ%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true"
FISHERMAN_URL="https://git.io/fisher"
PLUGINS_INSTALLER_URL="https://raw.githubusercontent.com/rgaidot/iterm-fish-fisherman-osx/master/install_plugins.sh"
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

function separator() {
    green_color
    echo "#=============================STEP FINISHED=============================#"
    reset_color
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
    echo "           iTerm + Fish + Fisherman           "
    echo "                 by @ghaiklor                 "
    echo "                                              "
    echo "                                              "

    blue_color
    echo "This script will guide you through installing all the required dependencies for Fish Shell + Fisherman + Themes and Plugins"
    echo "It will not install anything, without your direct agreement (do not afraid)"

    green_color
    read -p "Do you want to proceed with installation? (y/N) " -n 1 answer
    echo
    if [ ${answer} != "y" ]; then
        exit 1
    fi

    reset_color
}

function install_command_line_tools() {
    blue_color
    echo "Trying to detect installed Command Line Tools..."

    if ! [ $(xcode-select -p) ]; then
        blue_color
        echo "You don't have Command Line Tools installed"
        echo "They are required to proceed with installation"

        green_color
        read -p "Do you agree to install Command Line Tools? (y/N) " -n 1 answer
        echo
        if [ ${answer} != "y" ]; then
            exit 1
        fi

        blue_color
        echo "Installing Command Line Tools..."
        echo "Please, wait until Command Line Tools will be installed, before continue"
        echo "I can't wait for its installation from the script, so continue..."

        xcode-select --install
    else
        blue_color
        echo "Seems like you have installed Command Line Tools, so skipping..."
    fi

    reset_color
    separator
    sleep 1
}

function install_homebrew() {
    blue_color
    echo "Trying to detect installed Homebrew..."

    if ! [ $(which brew) ]; then
        blue_color
        echo "Seems like you don't have Homebrew installed"
        echo "We need it for completing the installation of your awesome terminal environment"

        green_color
        read -p "Do you agree to proceed with Homebrew installation? (y/N) " -n 1 answer
        echo
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
    else
        blue_color
        echo "You already have Homebrew installed, so skipping..."
    fi

    reset_color
    separator
    sleep 1
}

function install_iTerm2() {
    blue_color
    echo "Trying to find installed iTerm..."

    if ! [ $(ls /Applications/ | grep iTerm.app) ]; then
        blue_color
        echo "I can't find installed iTerm"

        green_color
        read -p "Do you agree to install it? (y/N) " -n 1 answer
        echo
        if [ ${answer} != "y" ]; then
            exit 1
        fi

        blue_color
        echo "Installing iTerm2..."

        brew cask install iterm2

        green_color
        echo "iTerm2 installed!"
    else
        blue_color
        echo "Found installed iTerm.app, so skipping..."
    fi

    reset_color
    separator
    sleep 1
}

function install_color_scheme() {
    green_color
    read -p "Do you want to install color scheme for iTerm? (y/N) " -n 1 answer
    echo
    if [[ ${answer} == "y" || ${answer} == "Y" ]]; then
        blue_color
        echo "Downloading color scheme in ${TEMP_DIR}..."

        cd ${TEMP_DIR}
        curl -fsSL ${COLOR_SCHEME_URL} > ./material-design.itermcolors

        blue_color
        echo "iTerm will be opened in 5 seconds, asking to import color scheme (in case, you installed iTerm)"
        echo "Close iTerm when color scheme will be imported"
        sleep 5
        open -W ./material-design.itermcolors

        green_color
        echo "Color Scheme is installed!"
    else
        blue_color
        echo "Skipping Color Scheme installation..."
    fi

    reset_color
    separator
    sleep 1
}

function install_nerd_font() {
    green_color
    read -p "Do you want to install patched Nerd Fonts? (y/N) " -n 1 answer
    echo
    if [[ ${answer} == "y" || ${answer} == "Y" ]]; then
        blue_color
        echo "Downloading Nerd Font into ${TEMP_DIR}..."

        cd ${TEMP_DIR}
        curl -fsSL ${NERD_FONT_URL} > ./nerd_font.otf

        blue_color
        echo "Font Manager will be opened in 5 seconds, prompting to install Nerd Font"
        echo "When you will be done with installing Nerd Font, close the Font Manager"
        sleep 5
        open -W ./nerd_font.otf

        green_color
        echo "Nerd Font is successfully installed!"
    else
        blue_color
        echo "Skipping Nerd Font installation..."
    fi

    reset_color
    separator
    sleep 1
}

function install_fish() {
    blue_color
    echo "Trying to detect installed Fish Shell..."

    if ! [ $(which fish) ]; then
        blue_color
        echo "Seems like you don't have Fish Shell installed"
        echo "Fish Shell is required to continue the installation"

        green_color
        read -p "Do you agree to install it? (y/N) " -n 1 answer
        echo
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
        chsh -s /usr/local/bin/fish
    else
        blue_color
        echo "You already have Fish Shell installed"
        echo "Just to be sure, that this is your default shell, I'm going to call chsh..."
    fi

    echo "$(command -v fish)" | sudo tee -a /etc/shells
    chsh -s "$(command -v fish)"

    green_color
    echo "Fish installed!"

    reset_color
    separator
    sleep 1
}

function install_fisherman() {
    blue_color
    echo "Fisherman is required for the installation"

    green_color
    read -p "Do you agree to install it? (y/N) " -n 1 answer
    echo
    if [ ${answer} != "y" ]; then
        exit 1
    fi

    blue_color
    echo "Installing Fisherman..."

    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs ${FISHERMAN_URL}

    green_color
    echo "Fisherman installed!"

    reset_color
    separator
    sleep 1
}

function install_fisherman_plugins_and_themes() {
    blue_color
    echo "Some of the Fisherman plugins requires external dependencies to be installed via Homebrew..."

    green_color
    read -p "Do you want to install Themes and Plugins for Fisherman? (y/N) " -n 1 answer
    echo
    if [[ ${answer} == "y" || ${answer} == "Y" ]]; then
        blue_color
        echo "Installing Themes and Plugins..."

        cd ${TEMP_DIR}
        curl -fsSL ${PLUGINS_INSTALLER_URL} > ./plugins_installer
        chmod +x ./plugins_installer
        ./plugins_installer

        green_color
        echo "Themes and Plugins installed!"
    else
        blue_color
        echo "Skipping Themes and Plugins installation..."
    fi

    reset_color
    separator
    sleep 1
}

function post_install() {
    green_color
    echo
    echo
    echo "Setup was successfully done"
    echo "Do not forgot to make two simple, but manual things:"
    echo
    echo "1) Open iTerm -> Preferences -> Profiles -> Colors -> Presets and apply color preset"
    echo "2) Open iTerm -> Preferences -> Profiles -> Text -> Font and apply font (for non-ASCII as well)"
    echo
    echo "Happy Coding!"

    reset_color
    exit 0
}

function on_sigterm() {
    red_color
    echo
    echo -e "Wow... Something serious happened!"
    echo -e "Though, I don't know what really happened :("
    echo -e "Please, refer to manual installation -> ${BLUE_COLOR}${GITHUB_REPO_URL_BASE}${RED_COLOR}"
    echo -e "In case, you want to help me fix this problem, raise an issue -> ${BLUE_COLOR}${GITHUB_REPO_URL_BASE}issues/new"

    reset_color
    exit 1
}

hello
install_command_line_tools
install_homebrew
install_iTerm2
install_color_scheme
install_nerd_font
install_fish
install_fisherman
install_fisherman_plugins_and_themes
post_install
