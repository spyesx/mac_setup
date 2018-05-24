# Terminal

## ZSH

ZShell is a shell designed for interactive use, and can be used as a powerful command interpreter for shell scripting.

Use Homebrew Zsh Instead of Mac OS X Default

```bash
brew install zsh

sudo vim /etc/shells
```

The resulting `/etc/shells` file should look like this:

```
/bin/bash
/bin/csh
/bin/sh
/bin/tcsh
/bin/zsh
/usr/local/bin/zsh
```


The `/usr/local/bin/zsh` location is the symlink Homebrew creates when installing zsh.

To actually change the shell assigned to your user account run

```bash
chsh -s /usr/local/bin/zsh
```

### Oh My ZSH

Install [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) by following the official documentation.

* [Plugins](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins)
* [Themes](https://github.com/robbyrussell/oh-my-zsh/tree/master/themes)

## Theme

Install theme from `./terminal/Material_spyesx.terminal`.

## History

Clear `history`

```bash
history -cw
```

Overwite `~/.bash_history` and delete it before recreate it.

```bash
shred -u ~/.bash_history && touch ~/.bash_history
```