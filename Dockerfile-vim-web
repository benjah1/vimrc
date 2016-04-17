FROM daocloud.io/benjah1/vimrc:core1.2
#FROM vim:core

MAINTAINER Benjah1 <benjaminhuang1@gmail.com>

# Download plugin
RUN cd /root/.vim/plugged/ 																												 && \
		git clone --depth 1 https://github.com/mattn/emmet-vim.git                     && \
		git clone --depth 1 https://github.com/othree/html5.vim.git                    && \
		git clone --depth 1 https://github.com/briancollins/vim-jst.git                && \
		git clone --depth 1 https://github.com/cakebaker/scss-syntax.vim.git           && \
		git clone --depth 1 https://github.com/ap/vim-css-color.git                    && \
		git clone --depth 1 https://github.com/vim-php/tagbar-phpctags.vim.git         && \
		git clone --depth 1 https://github.com/marijnh/tern_for_vim.git

RUN apk update && \
		apk add --virtual build-deps perl cmake python-dev build-base && \
		apk add nodejs php php-json php-phar php-openssl && \
		cd ~/.vim/plugged/tern_for_vim && \
		npm install && \
		cd ~/.vim/plugged/tagbar-phpctags.vim && \
		make && \
		apk del build-deps

RUN echo "source ~/vim_runtime/rc/web.vim" >> /root/.vimrc
ADD web/web.vim /root/vim_runtime/rc/
