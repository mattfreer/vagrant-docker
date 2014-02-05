cd ~/
git clone "https://github.com/mattfreer/dotvim.git"
ln -s ~/dotvim ~/.vim
ln -s ~/dotvim/.vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update

cd ~/
git clone "https://github.com/mattfreer/dottmux.git"
ln -s ~/dottmux/.tmux.conf ~/.tmux.conf
