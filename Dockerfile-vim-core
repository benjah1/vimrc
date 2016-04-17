FROM daocloud.io/benjah1/vimrc:base1.1
#FROM vim:base

MAINTAINER Benjah1 <benjaminhuang1@gmail.com>

#Build YouCompleteMe
RUN apk add --update --virtual build-deps go llvm perl cmake python-dev build-base                                   && \
    git clone --depth 1  https://github.com/Valloric/YouCompleteMe.git /root/.vim/plugged/youCompleteMe/    && \
    cd /root/.vim/plugged/youCompleteMe                                                                     && \
    git submodule update --init --recursive                                                                 && \
    /root/.vim/plugged/youCompleteMe/install.py --gocode-completer                                          && \
#Node.js deps (needed only if you're planning to mount and run jare/typescript)
    apk add libgcc libstdc++ libuv                                                                          && \
#Install and compile procvim.vim                                                                               
    git clone --depth 1 https://github.com/Shougo/vimproc.vim.git /root/.vim/plugged/vimproc.vim            && \
    cd /root/.vim/plugged/vimproc.vim                                                                       && \
    make                                                                                                    && \
    mv /root/.vim/plugged/vimproc.vim/lib/vimproc_linux64.so                                                   \
      /root/.vim/plugged/vimproc.vim/lib/vimproc_unix.so                                                    && \
#Cleanup
    rm -rf /root/.vim/plugged/youCompleteMe/third_party/ycmd/cpp /usr/lib/go  																 \
      /root/.vim/plugged/youCompleteMe/third_party/ycmd/clang_includes                                      && \
    apk del build-deps                                                                                      && \
    apk add libxt libx11 libstdc++

RUN cd /root/.vim/plugged/ 																												 && \
		git clone --depth 1 https://github.com/godlygeek/tabular.git                   && \
		git clone --depth 1 https://github.com/plasticboy/vim-markdown.git             && \
		git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides.git     && \
		git clone --depth 1 https://github.com/tpope/vim-fugitive.git                  && \
		git clone --depth 1 https://github.com/airblade/vim-gitgutter.git              && \
		git clone --depth 1 https://github.com/szw/vim-tags.git                        && \
		git clone --depth 1 https://github.com/majutsushi/tagbar.git                   && \
		git clone --depth 1 https://github.com/mileszs/ack.vim.git                     && \
		git clone --depth 1 https://github.com/kien/ctrlp.vim.git                      && \
		git clone --depth 1 https://github.com/terryma/vim-multiple-cursors.git        && \
		git clone --depth 1 https://github.com/bling/vim-airline.git                   && \
		git clone --depth 1 https://github.com/tomasr/molokai.git                      && \
		git clone --depth 1 https://github.com/terryma/vim-expand-region.git           && \
		git clone --depth 1 https://github.com/tpope/vim-dispatch.git                  && \
		git clone --depth 1 https://github.com/editorconfig/editorconfig-vim.git

