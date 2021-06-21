# Command Line Tools + Homebrew + iTerm2 + Fish Shell + Fisher + Plugins

Tired of using the built-in shell that has a bad developer experience?
Do you want to have the awesomeness in your terminal with a cool autocomplete, 24-bit colors, customized prompt to display the info you need most?
In such case, this guide is for you!

## The Problem

I use my terminal environment a lot for different tasks.
When you work with your terminal a lot, eventually, you end up with plugins you use, themes you installed, external dependencies you need and stuff like that.

Once you re-install the operating system, you need to go through configuration again - pain!
The same happened to me, so I’ve decided that I can automate installation for my terminal environment.

Moreover, I shared it with you all in a handy Bash script that is easy to use.

## Demo

|    Fish Completions    |    Customized Prompt    |    Native Notifications    |
| :--------------------: | :---------------------: | :------------------------: |
| ![Fish Completions][1] | ![Customized Prompt][2] | ![Native Notifications][4] |

|    Colorized built-ins    |    Colorized man pages    |    Node.js Version Manager    |
| :-----------------------: | :-----------------------: | :---------------------------: |
| ![Colorized built-ins][3] | ![Colorized man pages][5] | ![Node.js Version Manager][6] |

|    Jump between Projects    |    up to directory    |
| :-------------------------: | :-------------------: |
| ![Jump between Projects][7] | ![up to directory][8] |

## Features

- Bash script that automates the whole configuration routine and easy to use, just copy paste.
- The commands in script are idempotent, so that you can run the script as many times as you like.
- Detects if your machine does not have something installed and installs it automatically.
- Command Line Tools, Homebrew, iTerm2, Color Scheme, Nerd Fonts, Fish Shell, Fisher and Plugins included.
- Theme `bobthefish` which is based on popular `agnoster` and configured to use nerd fonts.
- Plugins included like `bass` to support Bash scripts in Fish, functions like `pj` to jump between projects, etc.

## Automatic Installation

Just copy and paste the command into your terminal - simple.
The installer detects what is absent from your machine and will install it.
In case your machine already has a dependency, it will skip the installation for it.

```shell
bash <(curl --silent --location "https://github.com/ghaiklor/iterm-fish-fisher-osx/blob/master/install.sh?raw=true")
```

## Manual Installation

In case you want to set up everything manually, this section is for you.

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

*NOTE: Depending on the MacBook you have, the path where Homebrew will be installed differs. For Intel based Mac it's /usr/local/bin/brew, while for ARM based Mac it's /opt/homebrew/bin/brew.*

### iTerm2

iTerm2 is a replacement for Terminal and the successor to iTerm.
It works on Macs with macOS 10.14 or newer.
iTerm2 brings the terminal into the modern age with features you never knew you always wanted.

This is one of the terminal emulators, that works great with color fidelity and patched fonts with ligatures.
Also, it has a tmux support and a lot of other stuff.
Check out their [website](https://iterm2.com) for more details.

```shell
brew install --cask iterm2
```

### iTerm 2 Color Scheme

Install the color scheme for iTerm2 that uses [Material Design Color Palette](https://github.com/MartinSeeler/iterm2-material-design).
Download the file [material-design-colors.itermcolors](https://github.com/MartinSeeler/iterm2-material-design/blob/6bd6c8b3627d079ed3ed74e152b12b1db1eb3a6b/material-design-colors.itermcolors?raw=true) and open it to import into iTerm2.
Afterwards, apply the color palette in Preferences -> Profiles -> Default -> Colors.

### iTerm 2 Nerd Fonts

There is a project called [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).
Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs (icons).
Specifically, to add a high number of extra glyphs from popular ‘iconic fonts’ such as Font Awesome, Devicons, Octicons, and others.

We use one of their fonts to render the theme that uses ligatures from there.
So you need to download the font, install it in the Font Book and apply in your terminal emulator [iTerm2].

When you [download the font](https://github.com/ryanoasis/nerd-fonts/blob/bc4416e176d4ac2092345efd7bcb4abef9d6411e/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete.ttf?raw=true), you can open it by double clicking.
It will open the Font Book and install the font.
Afterwards, go to iTerm2 -> Preferences -> Profiles -> Default -> Text and set the font `FiraCode Nerd Font`.

Set the same font for "Non-ASCII text" and do not forget to check the “Use ligatures“ checkbox.

### Fish Shell

[Fish Shell](https://fishshell.com) is a smart and user-friendly command line shell for Linux, macOS, and the rest of the family.
I don’t want to argue; it is just a preferred choice for me.

First, install the shell using homebrew:

```shell
brew install fish
```

Now, we can’t change the default shell without adding it to the list of known shells:

```shell
command -v fish | sudo tee -a /etc/shells
```

Change the default shell to Fish Shell:

```shell
chsh -s "$(command -v fish)"
```

### Fisher

Restart your terminal emulator and make sure that you are under Fish Shell now.

In case you own an ARM based Mac, you will have a Homebrew installed in `/opt/homebrew/bin/brew`.
The problem is that this path is not added by default, so you need to add it yourself.

```shell
fish_add_path /opt/homebrew/bin/
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

- [Bass](https://github.com/edc/bass)
- [Bobthefish](https://github.com/oh-my-fish/theme-bobthefish)
- [Colored Man Pages](https://github.com/PatrickF1/colored_man_pages.fish)
- [done](https://github.com/franciscolourenco/done)
- [grc](https://github.com/oh-my-fish/plugin-grc)
- [nvm](https://github.com/jorgebucaran/nvm.fish)
- [pj](https://github.com/oh-my-fish/plugin-pj)
- [upto](https://github.com/Markcial/upto)

When you finished installing the plugins, you need to configure some of them.
You need to enable the Nerd Fonts support for the theme, change the color palette and set the path where your projects located.

```shell
set --universal --export theme_nerd_fonts yes
set --universal --export theme_color_scheme zenburn
set --universal --export PROJECT_PATHS ~/Library/Projects
```

## License

[MIT](./LICENSE)

[1]: https://user-images.githubusercontent.com/3625244/122684115-468cb880-d20c-11eb-85a9-4f3d3f790027.gif
[2]: https://user-images.githubusercontent.com/3625244/122684124-4d1b3000-d20c-11eb-8975-35e346f92426.gif
[3]: https://user-images.githubusercontent.com/3625244/122684118-4987a900-d20c-11eb-815c-5604782cc64e.gif
[4]: https://user-images.githubusercontent.com/3625244/122684116-48ef1280-d20c-11eb-99d1-527c65b79f38.gif
[5]: https://user-images.githubusercontent.com/3625244/122684106-3ecd1400-d20c-11eb-8244-70172454a73b.gif
[6]: https://user-images.githubusercontent.com/3625244/122684120-4b516c80-d20c-11eb-82a8-497067fe682b.gif
[7]: https://user-images.githubusercontent.com/3625244/122684121-4c829980-d20c-11eb-8f6f-8cc8b0f063c6.gif
[8]: https://user-images.githubusercontent.com/3625244/122684125-4f7d8a00-d20c-11eb-8fd3-9685b4605322.gif
