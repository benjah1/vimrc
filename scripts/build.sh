#!/bin/bash -ex

set -e

VIM=/var/lib/vim
VIM_VERSION=v8.1.1525

# Vim 8
apt-get update
apt-get install -y curl gnupg
curl -sL https://deb.nodesource.com/setup_6.x | bash -

apt-get install -y build-essential cmake libncurses5-dev \
    libxpm-dev libxt-dev \
    python python2.7-dev \
    lua5.3 lua5.3-dev \
    libperl-dev \
    git ctags editorconfig \
    nodejs

# install vim
git clone --branch ${VIM_VERSION} --depth 1 https://github.com/vim/vim.git /tmp/vim
cd /tmp/vim
./configure --with-features=big \
			--enable-multibyte \
			--enable-largefile \
			--enable-pythoninterp \
			--with-python-config-dir=/usr/lib/python2.7/config \
			--enable-luainterp \
			--with-lua-prefix=/usr \
			--disable-gui \
			--disable-sysmouse \
			--disable-netbeans \
			--without-x \
			--prefix /usr
make VIMRUNTIMEDIR=/usr/share/vim/vim81
make install

## Dependency
curl -fLo ${VIM}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Plguin
mkdir -p ${VIM}/plugged
cd ${VIM}/plugged/

PLUG_LIST=($(grep Plug /vimrc/vim/rc/vundle.vim | grep -v ^\" | sed -E "s/Plug '(.*)'.*/\1/g"))

for ITEM in ${PLUG_LIST[@]}; do
	git clone --depth 1 https://github.com/${ITEM}.git
done

## Install Ycm
cd ${VIM}/plugged/youCompleteMe
git submodule update --init --recursive
./install.py --tern-completer

## Install ProcVim
cd ${VIM}/plugged/vimproc.vim
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
cd ${VIM}/plugged/tern_for_vim
npm install

# Clean up
apt-get purge -y build-essential autotools-dev cmake python2.7-dev python3*
apt-get autoremove -y
apt-get install -y python libpython2.7

## Deleting docs, tutorials, icons and lang
cd /usr/share/vim/vim81/
rm -rf lang/* tutor/* gvimrc_example.vim vimrc_example.vim
# find . -name *.txt | while read line; do rm "$line"; done
rm -rf /usr/share/man/* /usr/share/icons/* /usr/share/doc/* /tmp/* /var/cache/* /var/log/* /var/tmp/*
rm -rf ${VIM}/plugged/youCompleteMe/.git/modules/third_party

# Link
ln -s /vimrc/vim/vimrc ${VIM}/vimrc
ln -s /vimrc/vim/rc ${VIM}/rc
ln -s /vimrc/dotfiles/gitconfig /etc/gitconfig

mkdir -p ${VIM}/files/info
touch ${VIM}/viminfo
touch ${VIM}/vt_locations

chmod 777 -R ${VIM}
