# dotfiles
Personal repository to host my custom config files. To use, install [yadm](https://yadm.io) and run `yadm clone https://github.com/theRealPadster/dotfiles`. If it complains that conflicting dotfiles are present, delete them and the `.config/yadm folder`, and run it again.

### MOC
* Custom colours and layout
![MOC theme screenshot](https://i.imgur.com/1gPMbvd.png)

### Tilix (terminal) colour schemes
* Added three terminal colour schemes: Bright-and-bold, Nord, Snazzy, and Mitsuyoshi (pictured below)
![Mitsuyoshi scheme screenshot](https://i.imgur.com/TElTRhU.png)

### Spicetify themes
* Added a couple Spicetify themes that aren't on GitHub

### Fish
* Add [nvm](https://github.com/derekstavis/plugin-nvm) plugin
* Add [foreign-env](https://github.com/oh-my-fish/plugin-foreign-env) plugin
* Set [Scorphish](https://github.com/oh-my-fish/theme-scorphish) theme
  * Only show Node version in prompt
* Set `$EDITOR` to `vim`
* Automatically switch `node` version when find `.nvmrc` and revert to default version when none
* Add aliases:
  * `online`: `ping 8.8.8.8`
  * `ip`: returns local ipv4 address
  * (`ll` alias is already built into Fish)
* Linux-specific:
  * Set `$VISUAL` to `gedit`
  * Add aliases:
    * `update`: `yay -Syu`
* Mac-specific:
  * Add aliases:
    * `update`: `brew update && echo '...' && brew outdated`

### Bash
* Coloured `ls` output
* Set `$EDITOR` to `vim`
* Add `nvm` support
* Automatically switch `node` version when find `.nvmrc` and revert to default version when none
* Add aliases:
  * `online`: `ping 8.8.8.8`
  * `ip`: returns local ipv4 address
  * `ll`: `ls -l`
* Linux-specific:
  * Enabled vdpau
  * Set `$VISUAL` to `gedit`
  * Add Android SDK to `$PATH`
  * Add aliases:
    * `update`: `yay -Syu`
* Mac-specific:
  * Add aliases:
    * `update`: `brew update && echo '...' && brew outdated`

### Zsh
* Coloured `ls` output
* Add `nvm` support
* Automatically switch `node` version when find `.nvmrc` and revert to default version when none
* Set `$EDITOR` to `vim`
* Set up proper keybinds
* Set up history to be saved
* Add aliases:
  * `online`: `ping 8.8.8.8`
  * `addr`: returns local ipv4 address
  * `ll`: `ls -l`
* Linux-specific:
  * Enable zsh-theme-powerlevel10k theme (needs to be installed from AUR)
  * Enabled vdpau
  * Set `$VISUAL` to `gedit`
  * Add aliases:
    * `update`: `yay -Syu`
* Mac-specific:
  * Add Mac-style keybinds
  * Add aliases:
    * `update`: `brew update && echo '...' && brew outdated`

### Top
* Get rid of tree view

### Templates
* CSS file
  * Sets font to sans-serif
* Empty text file
* HTML file
  * Contains !DOCTYPE, head, title, body
* PHP file
  * Same as HTML file, but with php block in the body
* Shell script
  * Just a blank bash script

### Misc
* `user-dirs.dirs`
  * All standard GNOME folders, but replaced `Desktop` with `$HOME`, so a Desktop folder is not auto-created.
* Paru config
  * Add `NewsOnUpgrade`, `SudoLoop`, `RemoveMake = ask`, and `UpgradeMenu` options

#### TODO
* Add ssh configs
* Figure out how to remove unneeded files for OS types (e.g. Tilix configs on MacOS or iTerm2 configs on Linux)
* Figure out how to remove this README.md so it's not just sitting in the home directory (using yadm hooks?)
* Consolidate some of the shell configurations into single files instead of one per shell type/OS
* Figure out if I can do anything with the `50-mouse-acceleration.conf` file from [my old configs repo](https://github.com/theRealPadster/my-configs)
* Finish documenting configs, such as the iTerm configs and screenrc
* Enable p10k theme on macos?
* Update Fish configs to use the common shell files if possible
* Convert Fish aliases to [abbreviations](https://www.sean.sh/log/when-an-alias-should-actually-be-an-abbr/)
* Make the cross-shell compatible .shell-env implementation not so disgusting

- Test out themes from https://mayccoll.github.io/Gogh/
