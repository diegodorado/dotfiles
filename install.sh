set -e

echo -n "Symlinking dotfiles..."
#Symlink .zshrc and .vimrc
rm -f $HOME/.vimrc
ln -s $HOME/.dotfiles/vim/rc $HOME/.vimrc
rm -f $HOME/.bashrc
ln -s $HOME/.dotfiles/bash/rc $HOME/.bashrc
rm -f $HOME/.bash_profile
ln -s $HOME/.dotfiles/bash/profile $HOME/.bash_profile
rm -f $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/rc $HOME/.zshrc
rm -f $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/config $HOME/.gitconfig
rm -rf $HOME/.config/i3
ln -s $HOME/.dotfiles/i3 $HOME/.config/i3
rm -f $HOME/.moc/config
ln -s $HOME/.dotfiles/moc/config $HOME/.moc/config
rm -f $HOME/.moc/keymap
ln -s $HOME/.dotfiles/moc/keymap $HOME/.moc/keymap
mkdir -p $HOME/.config/termite
rm -f $HOME/.config/termite/config
ln -s $HOME/.dotfiles/termite/config $HOME/.config/termite/config
mkdir -p $HOME/.config/dunst
rm -f $HOME/.config/dunst/dunstrc
ln -s $HOME/.dotfiles/dunst/rc $HOME/.config/dunst/dunstrc

# Install Plug
# yay vim-plug
#vim +PlugInstall +q

#todo: set keymap here

echo "Done installing! "
