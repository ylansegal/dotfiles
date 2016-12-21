Ylan's dotfiles.
================

To setup your Mac the way Ylan likes it:

### Clone dotfiles

```
$ git clone git@github.com:ylansegal/dotfiles.git
$ ln -s dotfiles ~/.dotfiles
$ cd dotfiles
$ git submudle init && git submodule update
```

### Install Brew

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install Dependencies With Brew

```
$ brew bundle
```

### Unlock git-crypt

```
$ git-crypt unlock
```

### Install Oh-My-Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Link dotfiles from home

```
bin/link_dotfiles
```

This will link all dotfiles and the custom oh-my-zsh theme
