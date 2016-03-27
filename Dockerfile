FROM ubuntu

MAINTAINER Benjah1 <benjaminhuang1@gmail.com>

# Hack (fail on docker hub)
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && \ 
		apt-get install -y vim ncurses-term && \
		mkdir ~/.vim/bundle/ -p && \
		apt-get autoremove && \
		apt-get autoclean && \
		apt-get clean

ENV TERM=xterm-256color

# Build YCM
RUN cd ~/.vim/bundle && \
		apt-get install -y git python-dev cmake build-essential && \
		git clone --depth 1 https://github.com/valloric/youCompleteMe.git && \
		cd ~/.vim/bundle/youCompleteMe && \
		git submodule update --init --recursive && \
		python install.py && \
		apt-get purge -y git python-dev cmake make build-essential && \
		apt-get install -y python && \
		apt-get autoremove -y && \
		apt-get autoclean -y && \
		apt-get clean -y && \
		rm -rf .git/ && \
		rm -rf third_party/ycmd/cpp/ && \
		rm -rf third_party/ycmd/ymcd/tests/ && \
		rm -rf third_party/ycmd/third_party/bottle/test/ && \
		rm -rf third_party/ycmd/third_party/gocode/_testing/ && \
		rm -rf third_party/ycmd/third_party/jedi/tests/ && \
		rm -rf third_party/ycmd/clang_includes/

# Download plugin
RUN cd ~/.vim/bundle && \
		apt-get install -y git && \
		git clone --depth 1 https://github.com/gmarik/vundle.git && \
		git clone --depth 1 https://github.com/mattn/emmet-vim.git && \
		git clone --depth 1 https://github.com/othree/html5.vim.git && \
		git clone --depth 1 https://github.com/briancollins/vim-jst.git && \
		git clone --depth 1 https://github.com/cakebaker/scss-syntax.vim.git && \
		git clone --depth 1 https://github.com/godlygeek/tabular.git && \
		git clone --depth 1 https://github.com/plasticboy/vim-markdown.git && \
		git clone --depth 1 https://github.com/ap/vim-css-color.git && \
		git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides.git && \
		git clone --depth 1 https://github.com/tpope/vim-fugitive.git && \
		git clone --depth 1 https://github.com/airblade/vim-gitgutter.git && \
		git clone --depth 1 https://github.com/szw/vim-tags.git && \
		git clone --depth 1 https://github.com/majutsushi/tagbar.git && \
		git clone --depth 1 https://github.com/vim-php/tagbar-phpctags.vim.git && \
		git clone --depth 1 https://github.com/mileszs/ack.vim.git && \
		git clone --depth 1 https://github.com/marijnh/tern_for_vim.git && \
		git clone --depth 1 https://github.com/kien/ctrlp.vim.git && \
		git clone --depth 1 https://github.com/terryma/vim-multiple-cursors.git && \
		git clone --depth 1 https://github.com/bling/vim-airline.git && \
		git clone --depth 1 https://github.com/tomasr/molokai.git && \
		git clone --depth 1 https://github.com/terryma/vim-expand-region.git && \
		git clone --depth 1 https://github.com/Shougo/vimproc.vim.git && \
		git clone --depth 1 https://github.com/tpope/vim-dispatch.vim.git && \
		git clone --depth 1 https://github.com/editorconfig/editorconfig-vim.git

# Install Dependency
RUN apt-get install -y curl && \
		curl --silent --location https://deb.nodesource.com/setup_0.12 | bash - && \
		apt-get install -y ack-grep nodejs php5-cli ctags perl cmake python-dev build-essential unzip

# Install Tern for Vim
RUN cd ~/.vim/bundle/tern_for_vim && \
		npm install

# Install Tagbar PHP cTags
RUN cd ~/.vim/bundle/tagbar-phpctags.vim && \
		make

# Clean 
RUN apt-get purge -y curl cmake build-essential unzip && \
		apt-get autoremove -y

COPY . /root/vim_runtime

RUN	cd ~/vim_runtime && \
		./install_vimrc.sh

WORKDIR /src

CMD vim
