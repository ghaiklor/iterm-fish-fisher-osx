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
$ brew install jq
$ fisher omf/spark omf/license omf/battery omf/await omf/errno omf/brew omf/node-binpath omf/pj
$ set -U PROJECT_PATHS ~/Library/Projects
$
$ fisher bobthefish
$ set -U theme_title_display_process yes
$ set -U theme_title_display_path yes
$ set -U theme_title_display_user yes
$ set -U theme_title_use_abbreviated_path yes
$ set -U theme_display_ruby no
$ set -U theme_display_git yes
$ set -U theme_display_git_untracked yes
$ set -U theme_display_git_ahead_verbose yes
$ set -U theme_display_cmd_duration yes
$ set -U theme_show_exit_status yes
$ set -U theme_git_worktree_support no
$ set -U theme_color_scheme dark
$ fish_update_completions
```

- [BobTheFish Theme](https://github.com/oh-my-fish/theme-bobthefish)

A theme for nerds, makes fish even more powerful.
It's equipped with a hell of a lot of nice functions and key bindings to speed up your workflow.

- [Spark](https://github.com/oh-my-fish/plugin-spark)

Sparklines for your shell.
More documentation is available [here](https://github.com/holman/spark).
For instance, you can use it to quickly build a sparkline for Git commits by author `git shortlog -s | cut -f1 | spark`.

- [License](https://github.com/oh-my-fish/plugin-license)

Fish Shell plugin for generating github licenses.
As an external dependency it requires `jq` to be installed.

- [Battery](https://github.com/oh-my-fish/plugin-battery)

Display battery slots in your terminal by calling `battery`.

- [Await](https://github.com/oh-my-fish/plugin-await)

Wait last background job with a nice progress spinner.
`sleep 10 & await`, `git pull origin master & await`, etc...

- [ErrNo](https://github.com/oh-my-fish/plugin-errno)

Translate error codes to return status codes or lookup them by message strings.
It has completions, so you can easily navigate through `errno` and `strerror`.

- [Brew](https://github.com/oh-my-fish/plugin-brew)

Oh My Fish plugin to integrate Homebrew paths into shell.

- [Node BinPath](https://github.com/oh-my-fish/plugin-node-binpath)

Automatically add `node_modules/.bin` to PATH when present.
Useful, when you don't want to have globally installed npm packages, but has local installments in your project.
It allows to call, i.e. `mocha` as it was installed globally, but from your current project folder.

- [PJ](https://github.com/oh-my-fish/plugin-pj)

PJ allows you to easily jump between your favourite directories in a predictable manner.
You tell pj where to look for your projects, and it will allow you to jump to them easily with tab completion.
It even provides a convenient ability to open an editor in that directory from anywhere!

## License

[MIT](./LICENSE)
