Retired and replaced with https://github.com/l15n/xdg-config-home

# Dotfiles

Configuration files are stored in `home/` and are symlinked to `$HOME/` by the installer.

## Installer

Installer requires Ruby.

```
# Dry-run
bin/install

# Install
bin/install --now
```

Import new dotfiles by creating an empty file in `home/` and then run the installer.

e.g.

```
touch home/.config/app/app.config
bin/install --now
# Imports ~/.config/app/app.config and replaces with symlink
git add home
git commit
```
