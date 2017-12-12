# Known Issues

## The Fuck Plugin

### Issue

Sometimes, installation of The Fuck can be broken with the following error (or similar to this one):

```
fish: Unknown command '__tf_alias'
```

### Solution

You can simply uninstall The Fuck plugin, executing:

```shell
brew uninstall thefuck
fisher rm thefuck
```

Or, if you want to have it, install it manually, following official documentation for The Fuck.
Though, you still need to uninstall plugin `fisher rm thefuck`.
