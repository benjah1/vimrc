FROM alpine:edge

MAINTAINER Benjah1 <benjaminhuang1@gmail.com>

ADD ./ /root/vimrc

RUN cd /root/vimrc && \
		sh build.sh

ENV TERM=xterm-256color
ENV DISABLE=""

WORKDIR /src

CMD vim
