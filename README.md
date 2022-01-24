.dotfiles

Clone this repo into your home folder and ```stow home``` from the repo's root directory

You need to symlink to the Karabiner Elements Config folder manually because Karabiner-Elements will fail to detect the configuration file update and fail to reload the configuration if karabiner.json is a symbolic link:z` ```ln -s ~/.dotfiles/karabiner ~/.config```
