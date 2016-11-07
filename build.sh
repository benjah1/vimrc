#!/bin/bash

# Vim 8
apk update
apk add --virtual build-deps lua-dev python-dev build-base make cmake libxpm-dev libx11-dev libxt-dev ncurses-dev
apk add lua libsm libice libxt libx11 ncurses curl graphviz ctags perl python ncurses-terminfo

# config lua
# mkdir -p /usr/include/lua5.1/
# mv /usr/include/l*.h* /usr/include/lua5.1/

# install vim
git clone --branch v8.0.0069 --depth 1 https://github.com/vim/vim.git /tmp/vim
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

## Deleting docs, tutorials, icons and lang
cd /usr/share/vim/vim80/
rm -rf lang/* tutor/* gvimrc_example.vim vimrc_example.vim
# find . -name *.txt | while read line; do rm "$line"; done

## Dependency
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Plguin
mkdir -p /root/.vim/plugged
cd /root/.vim/plugged/
# git clone --depth 1 https://github.com/Valloric/YouCompleteMe.git
git clone --depth 1 https://github.com/shougo/neocomplete.vim.git
git clone --depth 1 https://github.com/shougo/vimproc.vim.git
git clone --depth 1 https://github.com/godlygeek/tabular.git
git clone --depth 1 https://github.com/plasticboy/vim-markdown.git
git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides.git
git clone --depth 1 https://github.com/tpope/vim-fugitive.git
git clone --depth 1 https://github.com/airblade/vim-gitgutter.git
git clone --depth 1 https://github.com/szw/vim-tags.git
git clone --depth 1 https://github.com/majutsushi/tagbar.git
git clone --depth 1 https://github.com/mileszs/ack.vim.git
git clone --depth 1 https://github.com/kien/ctrlp.vim.git
git clone --depth 1 https://github.com/terryma/vim-multiple-cursors.git
git clone --depth 1 https://github.com/bling/vim-airline.git
git clone --depth 1 https://github.com/tomasr/molokai.git
git clone --depth 1 https://github.com/terryma/vim-expand-region.git
git clone --depth 1 https://github.com/tpope/vim-dispatch.git
git clone --depth 1 https://github.com/editorconfig/editorconfig-vim.git
git clone --depth 1 https://github.com/mattn/emmet-vim.git
git clone --depth 1 https://github.com/othree/html5.vim.git
git clone --depth 1 https://github.com/briancollins/vim-jst.git
git clone --depth 1 https://github.com/cakebaker/scss-syntax.vim.git
git clone --depth 1 https://github.com/ap/vim-css-color.git
git clone --depth 1 https://github.com/vim-php/tagbar-phpctags.vim.git
# git clone --depth 1 https://github.com/marijnh/tern_for_vim.git
git clone --depth 1 https://github.com/scrooloose/nerdtree.git
git clone --depth 1 https://github.com/scrooloose/syntastic.git
git clone --depth 1 https://github.com/scrooloose/nerdtree-git-plugin.git

## Install Ycm
# apk add --virtual build-deps go llvm perl cmake python-dev build-base
# cd /root/.vim/plugged/youCompleteMe
# git submodule update --init --recursive
# /root/.vim/plugged/youCompleteMe/install.py --gocode-completer
# apk add libgcc libstdc++ libuv
# rm -rf /root/.vim/plugged/youCompleteMe/third_party/ycmd/cpp /usr/lib/go /root/.vim/plugged/youCompleteMe/third_party/ycmd/clang_includes
# apk add libxt libx11 libstdc++

## Install ProcVim
cd /root/.vim/plugged/vimproc.vim
make

## Install Ack
curl http://beyondgrep.com/ack-2.14-single-file > ack
mv ack /usr/bin
chmod 0755 /usr/bin/ack

## Install tagbar-phpctags
apk add php5 php5-json php5-phar php5-openssl
cd ~/.vim/plugged/tagbar-phpctags.vim
make

# Clean up
rm -rf /usr/share/man/* /usr/share/icons/* /usr/share/doc/* /tmp/* /var/cache/* /var/log/* /var/tmp/*
mkdir /var/cache/apk

apk del build-deps

# Link
ln -s /root/vimrc/.vimrc /root/.vimrc
ln -s /root/vimrc/.gitconfig /root/.gitconfig
