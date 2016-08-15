FROM alpine:3.4

MAINTAINER Benjah1 <benjaminhuang1@gmail.com>

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --update git bash && \
		git clone https://github.com/benjah1/vimrc.git /root/vimrc && \
		cd /root/vimrc && \
		bash build.sh

ENV TERM=xterm-256color
ENV DISABLE=""

WORKDIR /src

CMD vim
