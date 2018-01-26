# Known Issues

## The Fuck Plugin

### Issue

Sometimes, installation of The Fuck can be broken with the following error (or similar to this one):

```
fish: Unknown command '__tf_alias'
```

or

```
- (line 1): Unsupported use of '&&'. In fish, please use 'COMMAND; and COMMAND'.
begin; ;            function __tf_alias () {;                TF_PYTHONIOENCODING=$PYTHONIOENCODING;;                export TF_ALIAS=__tf_alias;;                export TF_SHELL_ALIASES=$(alias);;                export TF_HISTORY=$(fc -ln -10);;                export PYTHONIOENCODING=utf-8;;                TF_CMD=$(;                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@;                ) && eval $TF_CMD;;                unset TF_HISTORY;;                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;;                history -s $TF_CMD;;            };        ;
                                                                                                                                                                                                                                                                                                                                                                                                           ^
from sourcing file -
	called on line 60 of file /usr/local/Cellar/fish/2.6.0/share/fish/functions/eval.fish

in function 'eval'
	called on line 3 of file ~/.config/fish/conf.d/thefuck.init.fish

from sourcing file ~/.config/fish/conf.d/thefuck.init.fish
	called on line 244 of file /usr/local/Cellar/fish/2.6.0/share/fish/config.fish

from sourcing file /usr/local/Cellar/fish/2.6.0/share/fish/config.fish
	called during startup

source: Error while reading file '-'
```

### Solution

The problem is in the plugin for Fish itself.
You can get rid of it by simply uninstall The Fuck plugin, executing:

```shell
fisher rm thefuck
```

Try to install it manually, following official documentation for The Fuck.
Though, you still need to uninstall plugin `fisher rm thefuck`, since the plugin produces this error.
