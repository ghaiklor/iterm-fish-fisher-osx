# iTerm 2 + Fish Shell + Oh My Fish + Themes\Plugins

This guide is targeted for those, who wants to have a nice UI in the terminal with the rich features.

Please, raise your issue if something strange happened.
I'd like to improve this script, so it could work without any errors during the installation.

## The Problem

Every time, I've re-installed my operating system, I spend around ~30 minutes to set up my terminal environment again.
I bored of it, so I decided to make a list of all actions I doing, when setting it up, alongside with automatic script to do so, and share it with you all.

## How To Setup

You can achieve the same setup as mine, by manually setting up the environment ([following the guide](#manual-installation) below) or automatically [by executing the installer](#automatic-installation) `install.sh`.

## Key Features

- Material design theme with dark-soft colors
- Nerd fonts (Powerline patched font)
- Fish shell with installed Oh My Fish framework
- Theme `bobthefish` with enabled Vi mode
- A lot of plugins for simplifying your daily routine: generating LICENSE file; completion for git, brew, node_modules, etc; plugin for jumping between your project folders via one command; etc... (for a full list of plugins refer [here](#install-themes-and-plugins))

## Automatic Installation

__Highly recommended__ to run the script below under Bash session in default Terminal.app.
I can not guarantee proper installation outside of Terminal.app + Bash Shell.

```shell
$ bash <(curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-omf-osx/master/install.sh)
```

## Manual Installation

### iTerm2

#### Install iTerm 2

- [Download](http://www.iterm2.com/downloads.html) and install iTerm2 (it has better color fidelity than the built in Terminal).

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

- [Meslo M-DZ Mono](https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Meslo/M-DZ/complete/Meslo%20LG%20M%20DZ%20Regular%20Nerd%20Font%20Complete%20Mono.otf)
- [Others @ powerline fonts](https://github.com/ryanoasis/nerd-fonts)

Open the downloaded font and press "Install Font".

Set this font in iTerm2 (iTerm -> Preferences -> Profiles -> Text).

- Regular Font -> "Change Font"
- Non-ASCII Font -> "Change Font"

Restart iTerm2 for all changes to take effect.

### Fish Shell

#### Install Fish Shell

Download and install [Fish Shell](https://fishshell.com).

```shell
$ brew install fish
$ echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
$ chsh -s /usr/local/bin/fish
```

#### Install Fisherman

[Fisherman](https://fisherman.github.io) is a plugin manager for Fish Shell.

```shell
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
```

#### Install Themes and Plugins

```shell
$ fisher anicode
$ fisher await
$ fisher edc/bass
$ fisher laughedelic/brew-completions
$
$ brew install terminal-notifier
$ fisher done
$
$ fisher Shadowigor/plugin-errno-grep
$
$ brew install fzy
$ fisher fzy
$
$ fisher laughedelic/pisces
$ fisher shark
$
$ brew install thefuck
$ fisher omf/thefuck
$
$ fisher upto
$ fisher z
```

- [Anicode](https://github.com/fisherman/anicode)

Find arbitrary unicode characters matching a search pattern.
The last result match will be copied to your clipboard.

- [Await](https://github.com/fisherman/await)

Wait for background jobs.

- [Bass](https://github.com/edc/bass)

Bass makes it easy to use utilities written for Bash in fish shell.

- [Brew Completions](https://github.com/laughedelic/brew-completions)

Fish shell completions for Homebrew.

- [done](https://github.com/fisherman/done)

A fish plugin to automatically receive notifications when long processes finish.

- [errno-grep](https://github.com/Shadowigor/plugin-errno-grep)

Search for error codes, labels or messages via `errno-grep`.

- [fzy](https://github.com/fisherman/fzy)

`fzy` picks up history item and adds it to your shell.
You need to execute manually.

Run `fkill` and type process you want to kill.
`fkill` kills immediately.
Press enter and process will be killed.

- [pisces](https://github.com/laughedelic/pisces)

pisces is a plugin for fish that helps you to work with paired symbols like `()` and `''` in the command line.
Just as in your favorite text editor!

- [Shark](https://github.com/fisherman/shark)

Shark is a sparkline generator for fish.

- [The Fuck](https://github.com/oh-my-fish/plugin-thefuck)

This plug-in creates the necessary function to be used with The Fuck.

- [upto](https://github.com/fisherman/upto)

Gets you to a parent folder, heavily inspired by the plugin upto made by driv.

- [z](https://github.com/fisherman/z)

`z` tracks the directories you visit.
With a combination of frequency and recency, it enables you to jump to the directory in mind.

## License

[MIT](./LICENSE)
