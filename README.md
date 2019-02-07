Ylan's dotfiles.
================

To setup your Mac the way Ylan likes it:

*Note*: There are some circular dependecies here when setting up a new computer around when the ssh keys are
available to clone repos. They are managed by this repo, but are needed to clone. I still need to figure that out

### Install XCode

XCode is needed in order to have a sane build environment.
- Install XCode via the App Store.
- Ensure that it's launched at least once, so that it prompts to accept the license agreement.
- Install command line tools

### Install Brew

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install Dependencies With Brew

```
$ cd ~/Downloads
$ curl -o Brewfile https://raw.githubusercontent.com/ylansegal/dotfiles/master/Brewfile

# Edit Brewfile as needed, in case not everything is needed on machine
$ brew bundle
```

### Setup gpgtools

Some of the dotfiles in this repo are protected by GPG encryption. To setup GPG:

- Launch "GPG Keychain"
- Import private and public keys (kept elsewhere)
- Edit imported key and give Ulitmate trust

### Clone dotfiles with https

```
$ git clone https://github.com/ylansegal/dotfiles.git
$ cd ~
$ ln -s path/to/dotfiles .dotfiles
```

### Unlock git-crypt

```
$ cd dotfiles
$ git-crypt unlock
```

### Change Permissions on ssh keys

```
$ cd dotfiles
$ chmod 400 ssh/id_*
```

### Install Oh-My-Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Link dotfiles from home

```
$ bin/link_dotfiles
```

This will link all dotfiles and the custom oh-my-zsh theme

### Change dotfiles repo to use ssh

```
$ cd dotfiles
$ git remote set-url origin git@github.com:ylansegal/dotfiles.git
$ git submodule init && git submodule update
```

### Install atom packages

```
$ apm install --packages-file ./atom/packages-list.txt
```

Packages previously generated with `apm list --installed --bare > atom/packages-list.txt`

### Alfred

Download and install Alfred 2. Point settings to iCloud.

### Iterm 2

Point iTerm 2 to use settings in dotfiles folder
