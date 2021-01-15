# Command Line Tools + Homebrew + iTerm + Fish + Fisher + Plugins

This document shows you how to install terminal environment on your MacOS by installing required tools, shell and the plugins to it.

There are two ways on how to configure it: automatic installation via the script and the manual installation where I explain everything step by step.

## Manual Installation

### Command Line Tools

Command Line Tools are the tools that are required to use your Mac as a developer machine.
This package contains tools like git, header files, etc...
Although, you don’t need to install the whole XCode app for that.
You can install only the required part by executing:

```shell
xcode-select --install
```

### Homebrew

[Homebrew](https://brew.sh) is “The Missing Package Manager for macOS”.
It provides the way to install the packages to your machine as with usual package managers on Linux, like yum or apt-get.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### iTerm2

iTerm2 is a replacement for Terminal and the successor to iTerm.
It works on Macs with macOS 10.14 or newer.
iTerm2 brings the terminal into the modern age with features you never knew you always wanted.

This is one of the terminal emulators, that works great with color fidelity, patched fonts with ligatures.
Also, it has a tmux support and a lot of other stuff.
Check out their [website](https://iterm2.com) to more details.

```shell
/opt/homebrew/bin/brew install --cask iterm2
```

### iTerm 2 Material Design Color Scheme

Install the color scheme for iTerm2 that uses [Material Design Color Palette](https://github.com/MartinSeeler/iterm2-material-design).
Download the file [material-design-colors.itermcolors](https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors) and open it to import into iTerm2.
Afterwards, apply the color palette in Preferences -> Profiles -> Default -> Colors.

### iTerm 2 Patched Font

There is a project called [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).
Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs (icons).
Specifically, to add a high number of extra glyphs from popular ‘iconic fonts’ such as Font Awesome, Devicons, Octicons, and others.

We use one of their fonts to render the theme that uses ligatures from there.
So you need to download the font, install it in the Font Book and apply in your terminal emulator [iTerm2].

When you [download the font](https://github.com/ryanoasis/nerd-fonts/blob/fa69496f5a3291fbcb6c0ad5bcec9c8bcab842fc/patched-fonts/Meslo/M-DZ/Regular/complete/Meslo%20LG%20M%20DZ%20Regular%20Nerd%20Font%20Complete.ttf), you can open it by double clicking.
It will open the Font Book and install the font.
Afterwards, go to iTerm2 -> Preferences -> Profiles -> Default -> Text and set the font `MesloLGMDZ Nerd Font`.

Set the same font for "Non-ASCII text" and do not forget to check the “Use ligatures“ checkbox.

### Fish Shell

[Fish Shell](https://fishshell.com) is a smart and user-friendly command line shell for Linux, macOS, and the rest of the family.
I don’t want to argue; it is just a preferred choice for me.

First, install the shell using homebrew:

```shell
/opt/homebrew/bin/brew install fish
```

Now, we can’t change the default shell without adding it to the list of known shells:

```shell
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
```

Change the default shell to Fish Shell:

```shell
chsh -s /opt/homebrew/bin/fish
```

### Fisher

Restart your terminal emulator and make sure that you are under Fish Shell now.
Once you in, add the homebrew binaries to the PATH:

```shell
set --append --universal fish_user_paths /opt/homebrew/bin/
```

Afterwards, you can install Fisher.
Fisher is a plugin manager for Fish.
It helps manage functions, completions, bindings, and snippets from the command line.

```shell
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

### Plugins

Small things left.
Just install the plugins using Fisher.
Here is the list of plugins:

- [Anicode](https://github.com/igalic/anicode)
- [Bass](https://github.com/edc/bass)
- [Bobthefish](https://github.com/oh-my-fish/theme-bobthefish)
- [Brew Completions](https://github.com/laughedelic/brew-completions)
- [Colored Man Pages](https://github.com/PatrickF1/colored_man_pages.fish)
- [done](https://github.com/franciscolourenco/done)
- [plugin-errno-grep](https://github.com/Shadowigor/plugin-errno-grep)
- [fzy](https://github.com/gyakovlev/fish-fzy)
- [grc](https://github.com/oh-my-fish/plugin-grc)
- [Kill on Port](https://github.com/vincentjames501/fish-kill-on-port)
- [node-bin-path](https://github.com/oh-my-fish/plugin-node-binpath)
- [nvm](https://github.com/jorgebucaran/nvm.fish)
- [pj](https://github.com/oh-my-fish/plugin-pj)
- [rustup](https://github.com/oh-my-fish/plugin-rustup)
- [upto](https://github.com/Markcial/upto)
