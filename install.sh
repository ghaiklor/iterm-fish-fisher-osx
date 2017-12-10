#!/usr/bin/env bash

set -e
trap "echo Something went wrong...\nI'm not a specialist in shell scripts, so better to proceed with manual installation then\nhttps://github.com/ghaiklor/iterm-fish-omf-osx" SIGINT SIGTERM

HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"

# Greetings
hello() {
    echo '    _____      __            __         ____  '
    echo '   / __(_)____/ /_     _____/ /_  ___  / / /  '
    echo '  / /_/ / ___/ __ \   / ___/ __ \/ _ \/ / /   '
    echo ' / __/ (__  ) / / /  (__  ) / / /  __/ / /    '
    echo '/_/ /_/____/_/ /_/  /____/_/ /_/\___/_/_/     '
    echo '                                              '
    echo '       iTerm + Oh My Fish Installation        '
    echo '                                              '
    echo '                                              '
}

# Homebrew
install_homebrew() {
    echo "Seems like you don't have Homebrew installed"
    echo "But, we need it for completing the installation of your awesome terminal environment"
    echo "Installing Homebrew..."

    ruby -e "$($HOMEBREW_URL)"
    brew update
    brew upgrade

    echo "Homebrew installed!\n\n"
}

# Fish
install_fish() {
    echo "Installing Fish Shell..."
    echo "The script will ask you the password for sudo 2 times:"
    echo "1) When adding fish shell into /etc/shells via tee"
    echo "2) When changing your default shell via chsh -s"

    brew install fish
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish

    echo "Fish installed!\n\n"
}

# Oh My Fish
install_omf() {
    echo "Installing Oh My Fish..."

    curl -L https://get.oh-my.fish | fish

    echo "Oh My Fish installed!\n\n"
}

# Themes
install_omf_themes() {
    echo "Installing Themes..."

    omf install bobthefish

    echo "Themes installed!\n\n"
}

# Plugins
install_omf_plugins() {
    echo "Installing Plugins..."

    brew install jq grc thefuck
    omf install spark license battery git-flow await hash errno brew node-binpath grc pj thefuck
    set -gx PROJECT_PATHS ~/Library/Projects

    echo "Plugins installed!\n\n"
}

hello

test -x brew || install_homebrew
test -x fish || install_fish

install_omf

# Themes
read -p "Install Oh My Fish Themes? (y/n)" -n 1 answer
echo
if [[$answer == "y" || $answer == "Y"]]; then
    install_omf_themes
fi

# Plugins
read -p "Install Oh My Fish Plugins? (y/n)" -n 1 answer
echo
if [[$answer == "y" || $answer == "Y"]]; then
    install_omf_plugins
fi
