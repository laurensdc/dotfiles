# Dotfiles

Using [GNU stow](https://www.gnu.org/software/stow/manual/stow.html) to symlink these dotfiles to the right locations

## Set config from remote

1. Get stow
1. Clone the repo into your home folder
1. cd into the `dotfiles` repo
1. Run `stow .`

    ```
    sudo apt install stow
    git clone https://github.com/Laurensdc/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    stow .
    ```

The structure of this repo represents the home dir.

## Add config

Let's say we want to add our existing ~/.gitconfig to our dotfiles repo.

1. Back up the original file
1. Move it into the repo
1. Run `stow .`

    ```
    cp ~/.gitconfig ~/.gitconfig.bak
    mv ~/.gitconfig ~/dotfiles
    stow .
    ```

1. Push your git changes


# Top level config

The files in the top level of this repo will go straight to the home folder

`.zshrc` for zsh shell config and aliases
`.gitconfig` for global git config
`.vimrc` for some old school vim config

# Todo
Notes to self, this is probably not relevant to you, dear reader

- Check in AHK
- Check in SC shortcuts
- Check in GBoard shortcuts
- Check in CCLite dictionaries & set up easy sync
- Check in darktable shortcut?
