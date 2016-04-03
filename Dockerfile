FROM alpine

MAINTAINER Benjah1 <benjaminhuang1@gmail.com>

RUN sed -i 's/dl-4.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update && \
		apk add vim	graphviz && \
		apk add libsm libice libxt libx11 ncurses && \
		apk add git curl ctags python bash ncurses-terminfo && \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ENV TERM=xterm-256color
ENV DISABLE=""

ADD .vimrc /root/.vimrc
ADD rc /root/vim_runtime/rc

WORKDIR /src

CMD vim
