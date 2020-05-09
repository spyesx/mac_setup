
# Sublime Text

## Install

```bash
brew cask install sublime-text
```

## Packages

Read [package.md](packages.md) to get a list of all packages.

## User configuration

Place [user-settings.js](user-settings.js) into Sublime Text configuration folder `Packages/User`.

## Theme

Source : [material-theme](https://github.com/equinusocio/material-theme) even though the owner fell in love with another editor.

I use a slightly different [color scheme](Material-Theme.tmTheme).

## Add CLI shortcut

```bash
ln -s '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' /usr/local/bin/sublime
```

Open the current folder

```bash
sublime .
```

Open a file

```bash
sublime path/to/file.ext
```
