#!/bin/bash -ex

set -e

# Vim 8

apt-get update
apt-get install -y curl gnupg
curl -sL https://deb.nodesource.com/setup_6.x | bash -
# apt-get install -y build-essential liblua5.3-dev python-dev libxpm-dev libx11-dev libxt-dev libncurses5-dev golang llvm
# apt-get install -y git lua5.3 libsm libice libxt libx11 ncurses curl ctags perl python ncurses-terminfo editorconfig libgcc libstdc++ libuv nodejs
apt-get install -y build-essential cmake libncurses5-dev \
    libxpm-dev libxt-dev \
    python python2.7-dev \
    lua5.3 lua5.3-dev \
    libperl-dev \
    git ctags editorconfig

apt-get install -y nodejs

# install vim
git clone --branch v8.0.0946 --depth 1 https://github.com/vim/vim.git /tmp/vim
cd /tmp/vim
./configure --with-features=big \
			--enable-multibyte \
			--enable-largefile \
			--enable-pythoninterp \
			--with-python-config-dir=/usr/lib/python2.7/config \
			--enable-luainterp \
			--with-lua-prefix=/usr \
			--disable-gui \
			--disable-netbeans \
			--without-x \
			--prefix /usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
make install

## Dependency
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Plguin
mkdir -p /root/.vim/plugged
cd /root/.vim/plugged/
git clone --depth 1 https://github.com/valloric/youCompleteMe.git
# git clone --depth 1 https://github.com/shougo/neocomplete.vim.git
git clone --depth 1 https://github.com/shougo/vimproc.vim.git
git clone --depth 1 https://github.com/godlygeek/tabular.git
git clone --depth 1 https://github.com/plasticboy/vim-markdown.git
git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides.git
git clone --depth 1 https://github.com/tpope/vim-fugitive.git
git clone --depth 1 https://github.com/airblade/vim-gitgutter.git
git clone --depth 1 https://github.com/szw/vim-tags.git
git clone --depth 1 https://github.com/majutsushi/tagbar.git
git clone --depth 1 https://github.com/mileszs/ack.vim.git
git clone --depth 1 https://github.com/ctrlpvim/ctrlp.vim.git
git clone --depth 1 https://github.com/terryma/vim-multiple-cursors.git
git clone --depth 1 https://github.com/itchyny/lightline.vim.git
git clone --depth 1 https://github.com/tomasr/molokai.git
git clone --depth 1 https://github.com/terryma/vim-expand-region.git
git clone --depth 1 https://github.com/tpope/vim-dispatch.git
git clone --depth 1 https://github.com/editorconfig/editorconfig-vim.git
# git clone --depth 1 https://github.com/mattn/emmet-vim.git
git clone --depth 1 https://github.com/othree/html5.vim.git
# git clone --depth 1 https://github.com/briancollins/vim-jst.git
git clone --depth 1 https://github.com/cakebaker/scss-syntax.vim.git
git clone --depth 1 https://github.com/ap/vim-css-color.git
# git clone --depth 1 https://github.com/vim-php/tagbar-phpctags.vim.git
git clone --depth 1 https://github.com/ternjs/tern_for_vim.git
git clone --depth 1 https://github.com/scrooloose/nerdtree.git
git clone --depth 1 https://github.com/vim-syntastic/syntastic.git
git clone --depth 1 https://github.com/scrooloose/nerdtree-git-plugin.git
git clone --depth 1 https://github.com/mhinz/vim-startify.git

## Install Ycm
cd /root/.vim/plugged/youCompleteMe
git submodule update --init --recursive
./install.py --tern-completer

## Install ProcVim
cd /root/.vim/plugged/vimproc.vim
make

## Install Ack
curl https://beyondgrep.com/ack-2.18-single-file > ack
mv ack /usr/bin
chmod 0755 /usr/bin/ack

## Install tagbar-phpctags
# apk add php5 php5-json php5-phar php5-openssl
# cd ~/.vim/plugged/tagbar-phpctags.vim
# make

## Install tern for vim
cd ~/.vim/plugged/tern_for_vim
npm install

# Clean up
apt-get purge -y build-essential autotools-dev cmake python2.7-dev python3*
apt-get autoremove -y
apt-get install -y python libpython2.7

## Deleting docs, tutorials, icons and lang
cd /usr/share/vim/vim80/
rm -rf lang/* tutor/* gvimrc_example.vim vimrc_example.vim
# find . -name *.txt | while read line; do rm "$line"; done
rm -rf /usr/share/man/* /usr/share/icons/* /usr/share/doc/* /tmp/* /var/cache/* /var/log/* /var/tmp/*
rm -rf /root/.vim/plugged/youCompleteMe/.git/modules/third_party

# Link
ln -s /root/vimrc/vimrc /etc/vimrc
ln -s /root/vimrc/gitconfig /etc/gitconfig

mkdir -p /root/.vim/files/info
touch /root/.viminfo
touch /root/.vt_locations

chmod 777 -R /root/.vim
chmod 777 -R /root/vimrc
chmod 777 /root/.viminfo
chmod 777 /root/.vt_locations
