# .dotfiles

Configuration setup to manage configurations across different setups. Uses [rcm](https://github.com/thoughtbot/rcm) to manage the dotfiles. I currently have GUI Linux split into a separate tag since I often develop on VMs over ssh on my mac.

## Install

To install, run:

```
rcup
```

If you want to install with GUI Linux specific dotfiles as well, run:

```
rcup -t linux-gui
```

## `~/.config`

- `nvim`  
  Configuration files for my favourite editor.
- `alacritty`  
  Speedy terminal emulator.

...and GUI Linux specific dotfiles:

- `i3`  
  My window manager setup
- `redshift`  
  Good for eyes
- `picom`  
  The new compton (literally). Mostly opacity stuff
