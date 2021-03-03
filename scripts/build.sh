#!/bin/bash -ex

set -e

VIM=/var/lib/vim
VIM_VERSION=v8.2.2560

# Vim 8
apt-get update
# apt-get install -y curl gnupg
# curl -sL https://deb.nodesource.com/setup_6.x | bash -

apt-get install -y curl build-essential cmake libncurses5-dev \
	autotools-dev automake autoconf pkg-config \
	python3 python3.9-dev \
	git editorconfig
    # libxpm-dev libxt-dev \
    # libperl-dev \
    # lua5.3 lua5.3-dev \
    # python python2.7-dev \
    # nodejs npm

## Install universal ctags
cd /tmp
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure --prefix=/usr/local
make -j4
make install


# install vim
git clone --branch ${VIM_VERSION} --depth 1 https://github.com/vim/vim.git /tmp/vim
cd /tmp/vim
./configure --with-features=big \
			--enable-multibyte \
			--enable-largefile \
			--enable-python3interp \
			--with-python3-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu \
			--disable-gui \
			--disable-sysmouse \
			--disable-netbeans \
			--without-x \
			--prefix /usr


			# --enable-pythoninterp \
			# --with-python-config-dir=/usr/lib/python2.7/config \
			# --enable-luainterp \
			# --with-lua-prefix=/usr \

make -j4 VIMRUNTIMEDIR=/usr/share/vim/vim82
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
python3 install.py #--tern-completer

## Install ProcVim
cd ${VIM}/plugged/vimproc.vim
make -j4


## Install Ack
# curl https://beyondgrep.com/ack-2.18-single-file > ack
# mv ack /usr/bin
# chmod 0755 /usr/bin/ack

## Install tagbar-phpctags
# apk add php5 php5-json php5-phar php5-openssl
# cd ~/.vim/plugged/tagbar-phpctags.vim
# make

## Install tern for vim
# cd ${VIM}/plugged/tern_for_vim
# npm install

# Clean up
apt-get purge -y build-essential autotools-dev cmake python2.7-dev python3.9-dev autoconf automake pkg-config
apt-get autoremove -y
apt-get install -y python3 libpython3.9 # python libpython2.7 

## Deleting docs, tutorials, icons and lang
cd /usr/share/vim/vim82/
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
