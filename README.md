# iTerm 2 + Fish Shell + Fisher + Themes\Plugins

_NOTE: The automation script that does all the dirty work is supported only on Intel MacBook. There are sub-folders `arm` and `intel` in the repository where the updated guides live for those platforms. But, there are no automation scripts and I can't figure out how to write those and don't make a code duplication. So that, you can freely use the installer for Intel Macbook, it works, but it won't on Apple M* chips._

This guide is targeted for those, who wants to have a nice UI in the terminal with the rich features.

Please, raise your issue if something strange happened.
I'd like to improve this script, so it could work without any errors during the installation.

## The Problem

Every time, I've re-installed my operating system, I spend around ~30 minutes to set up my terminal environment again.
I bored of it, so I decided to make a list of all actions I doing, when setting it up, alongside with automatic script to do so, and share it with you all.

## Screenshots & GIFs

They are available [here](./SCREENSHOTS.md).

## Key Features

The script installs things related to terminal environment only:

- Installs Command Line Tools, Homebrew, iTerm2, Fish, Fisher.
- Installs Material Design color preset for iTerm2 and patched Meslo Nerd Font.
- Theme `bobthefish`, which is based on popular `agnoster`.
- Completions for `brew`, `git`, `./node_modules/.bin` and others...

Installs a lot of useful plugins for Fish Shell:

- `bass` plugin that makes easy to use scripts written for Bash Shell in Fish Shell.
- Plugin `done` that notifies you when the process is finished. i.e. you can run `npm install` command and switch back into your browser. When `npm install` is done, you will get OSX notification.
- `fzy` plugin adds a hotkey <kbd>Ctrl</kbd>+<kbd>R</kbd> that allows to show and search in your command history.
- `pj` function allows to easily jump between your favorite directories. It installs with configured `~/Library/Projects` folder, so you can jump to any of your projects by calling `pj <PROJECT_FOLDER_NAME>`.
- `upto` function gets you to a parent folder. I.e. you're inside `a/b/c/d/e/`, calling `upto b` will navigate you into `a/b`.
- ...and others, you can find the full list below in manual guide.

## How To Setup

You can achieve the same setup as mine, by manually setting up the environment ([following the guide](#manual-installation) below) or automatically [by executing the installer](#automatic-installation) `install.sh`.

## Automatic Installation

__Highly recommended__ to run the script below under Bash session in default Terminal.app.
I can not guarantee proper installation outside of Terminal.app + Bash Shell.

```shell
bash <(curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-fisher-osx/master/install.sh)
```

## Manual Installation

### Command Line Tools

You don't need to install the whole Xcode for it.
By executing the command below, you will get only the command line tools without heavy IDE and dependencies it take:

```shell
xcode-select --install
```

### Homebrew

Homebrew is a software manager for MacOS.
Its purpose is like the purpose of `apt-get` on Debian-based systems or `yum` on Fedora.
You can install command line tools from there or even full-featured applications.

[Install Homebrew](https://brew.sh)

### iTerm2

#### Install iTerm 2

- [Download](https://www.iterm2.com/downloads.html) and install iTerm2 (it has better color fidelity than the built in Terminal).

or install it via Homebrew:

```shell
brew cask install iterm2
```

#### Install Color Scheme

Get the iTerm color settings:

- [Material Design Theme](https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors)
- [More themes @ iterm2colorschemes](http://iterm2colorschemes.com)

Just save it somewhere and open the file(s).
The color settings will be imported into iTerm2.
Apply them in iTerm through iTerm -> Preferences -> Profiles -> Colors -> Load Presets.
You can create a different profile, other than Default if you wish to do so.

#### Install Patched Font

- [Meslo LG M DZ Regular Nerd Font Complete Mono](https://github.com/ryanoasis/nerd-fonts/blob/25eec835188d2316ef3fe59820950d9f90c5bcf4/patched-fonts/Meslo/M-DZ/Regular/complete/Meslo%20LG%20M%20DZ%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true)
- [Others @ powerline fonts](https://github.com/ryanoasis/nerd-fonts)

Open the downloaded font and press "Install Font".

Set this font in iTerm2 (iTerm -> Preferences -> Profiles -> Text).

- Regular Font -> "Change Font"
- Non-ASCII Font -> "Change Font"

Restart iTerm2 for all changes to take effect.

### Fish Shell

#### Install Fish Shell

Download and install [Fish Shell](https://fishshell.com).

or using Homebrew:

```shell
brew install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

#### Install Fisher

[Fisher](https://github.com/jorgebucaran/fisher) is a plugin manager for Fish Shell.

```shell
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

#### Install Themes and Plugins

- [Anicode](https://github.com/fisherman/anicode)
- [Bass](https://github.com/edc/bass)
- [Bob The Fish](https://github.com/oh-my-fish/theme-bobthefish)
- [Brew Completions](https://github.com/laughedelic/brew-completions)
- [Colored Man Pages](https://github.com/patrickf3139/colored_man_pages.fish)
- [done](https://github.com/fisherman/done)
- [errno-grep](https://github.com/Shadowigor/plugin-errno-grep)
- [fzy](https://github.com/fisherman/fzy)
- [GRC](https://github.com/oh-my-fish/plugin-grc)
- [kill-on-port](https://github.com/vincentjames501/fish-kill-on-port)
- [Node BinPath](https://github.com/oh-my-fish/plugin-node-binpath)
- [NVM (Node Version Manager)](https://github.com/jorgebucaran/fish-nvm)
- [PJ](https://github.com/oh-my-fish/plugin-pj)
- [rustup](https://github.com/oh-my-fish/plugin-rustup)
- [upto](https://github.com/fisherman/upto)

## License

[MIT](./LICENSE)
