FROM alpine:3.2

MAINTAINER Benjah1 <benjaminhuang1@gmail.com>

RUN sed -i 's/dl-4.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN cd /tmp && \
		apk add --update --virtual build-deps python python-dev build-base \
      make mercurial libxpm-dev libx11-dev libxt-dev ncurses-dev git && \
		git clone --depth 1 https://github.com/vim/vim.git && \
		cd /tmp/vim && \
		./configure --with-features=big \
                #needed for editing text in languages which have many characters
                --enable-multibyte \     
                #python interop needed for some of my plugins
                --enable-pythoninterp \
                --with-python-config-dir=/usr/lib/python2.7/config \
                --disable-gui \
                --disable-netbeans \
                --prefix /usr && \
		make VIMRUNTIMEDIR=/usr/share/vim/vim74                                    && \
    make install                                                               && \
    apk del build-deps                                                         && \
    apk add libsm libice libxt libx11 ncurses git curl bash graphviz ctags python ncurses-terminfo && \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim      && \
    #deleting docs, tutorials, icons and lang
    rm -rf /usr/share/man/* /usr/share/icons/* /usr/share/doc/* /tmp/* \
      /var/cache/* /var/log/* /var/tmp/*                                       && \
    mkdir /var/cache/apk                                                       && \
    cd /usr/share/vim/vim74/                                                   && \ 
    rm -rf lang/* tutor/* gvimrc_example.vim vimrc_example.vim                 && \
    find . -name *.txt | while read line; do rm "$line"; done

ENV TERM=xterm-256color
ENV DISABLE=""

ADD .vimrc /root/.vimrc
ADD rc /root/vim_runtime/rc

WORKDIR /src

CMD vim
