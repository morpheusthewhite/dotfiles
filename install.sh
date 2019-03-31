#!/bin/sh

# installing needed packages (for Debian based systems)
sudo apt-get install vim zsh wget zathura autojump tmux zsh-syntax-highlighting

# installing oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# copying dotfiles
cp . -rv --backup=numbered * ~

# install vundle (vim)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

