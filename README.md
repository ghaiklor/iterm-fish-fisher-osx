# iTerm 2 + Fish Shell + Fisher + Themes\Plugins

_NOTE: The automation script that does all the dirty work is supported only on Intel MacBook. There are sub-folders `arm` and `intel` in the repository where the updated guides live for those platforms. But, there are no automation scripts and I can't figure out how to write those and don't make a code duplication. So that, you can freely use the installer for Intel Macbook, it works, but it won't on Apple M* chips._

This guide is targeted for those, who wants to have a nice UI in the terminal with the rich features.

Please, raise your issue if something strange happened.
I'd like to improve this script, so it could work without any errors during the installation.

## The Problem

Every time, I've re-installed my operating system, I spend around ~30 minutes to set up my terminal environment again.
I bored of it, so I decided to make a list of all actions I doing, when setting it up, alongside with automatic script to do so, and share it with you all.

## Demo

| Completions for Homebrew |   Colorized man pages   | MacOS notifications |
| :----------------------: | :---------------------: | :-----------------: |
|  ![brew-completions][1]  | ![colored-man-pages][2] |     ![done][3]      |

|  Completions for Git  | Colorizer for ping, ls, cat, etc | Node.js Version Manager |
| :-------------------: | :------------------------------: | :---------------------: |
| ![git-completions][4] |            ![grc][5]             |        ![nvm][6]        |

| Jump between projects | Navigate to upper folders |
| :-------------------: | :-----------------------: |
|       ![pj][7]        |        ![upto][8]         |

## Key Features

The script installs things related to terminal environment only:

- Installs Command Line Tools, Homebrew, iTerm2, Fish, Fisher.
- Installs Material Design color preset for iTerm2 and patched Meslo Nerd Font.
- Theme `bobthefish`, which is based on popular `agnoster`.
- Completions for `brew`, `git`, `./node_modules/.bin` and others...

Installs a lot of useful plugins for Fish Shell:

- `bass` plugin that makes easy to use scripts written for Bash Shell in Fish Shell.
- Plugin `done` that notifies you when the process is finished. i.e. you can run `npm install` command and switch back into your browser. When `npm install` is done, you will get OSX notification.
- `pj` function allows to easily jump between your favorite directories. It installs with configured `~/Library/Projects` folder, so you can jump to any of your projects by calling `pj <PROJECT_FOLDER_NAME>`.
- `upto` function gets you to a parent folder. I.e. you're inside `a/b/c/d/e/`, calling `upto b` will navigate you into `a/b`.
- ...and others, you can find the full list in manual guide.

## Automatic Installation

__Highly recommended__ to run the script below under Bash session in default Terminal.app.
I can not guarantee proper installation outside of Terminal.app + Bash Shell.

```shell
bash <(curl -s https://raw.githubusercontent.com/ghaiklor/iterm-fish-fisher-osx/master/install.sh)
```

## Manual Installation

Because Apple MacBooks comes with different chips now, there are some difference in how to install the environment for ARM based or Intel based desktops.
There is not much and many things are still common for both platforms, but I went with separate guides, anyway.
So, here is a guide for [ARM based desktops](./arm/README.md) and [Intel based desktops](./intel/README.md).

## License

[MIT](./LICENSE)

[1]: https://user-images.githubusercontent.com/3625244/122667804-66e15680-d1bd-11eb-834c-a58fb32d95ad.gif
[2]: https://user-images.githubusercontent.com/3625244/122667807-6ba60a80-d1bd-11eb-9b08-859fe6fd2504.gif
[3]: https://user-images.githubusercontent.com/3625244/122667812-6d6fce00-d1bd-11eb-8073-d92e6e2d82d5.gif
[4]: https://user-images.githubusercontent.com/3625244/122667813-6e086480-d1bd-11eb-9d98-cf7f286e70ea.gif
[5]: https://user-images.githubusercontent.com/3625244/122667814-6ea0fb00-d1bd-11eb-991f-0a6c0db81aeb.gif
[6]: https://user-images.githubusercontent.com/3625244/122667815-6ea0fb00-d1bd-11eb-95b1-59aead1dde7c.gif
[7]: https://user-images.githubusercontent.com/3625244/122667816-6f399180-d1bd-11eb-9225-0f0902c8fc3f.gif
[8]: https://user-images.githubusercontent.com/3625244/122667817-6f399180-d1bd-11eb-9c11-09b2eb2e5418.gif
