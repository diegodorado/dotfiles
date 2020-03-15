set -e

echo -n "Symlinking dotfiles..."
#Symlink .zshrc and .vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
#ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
#ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Install Plug
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#vim +PlugInstall +q

#git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/zsh-syntax-highlighting
#git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.dotfiles/zsh-autosuggestions

echo "Done installing! "
