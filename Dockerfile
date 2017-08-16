FROM debian:stretch-slim

MAINTAINER Benjah1 <benjaminhuang1@gmail.com>

ARG GIT_NAME="Benjah1"
ARG GIT_EMAIL="benjaminhuang1@gmail.com"

ENV GIT_AUTHOR_NAME=$GIT_NAME
ENV GIT_AUTHOR_EMAIL=$GIT_EMAIL
ENV GIT_COMMITTER_NAME=$GIT_NAME
ENV GIT_COMMITTER_EMAIL=$GIT_EMAIL

ENV VIM=/etc

ADD ./ /root/vimrc

RUN cd /root/vimrc && \
		sh build.sh

ENV TERM=xterm-256color
ENV DISABLE=""

WORKDIR /src

CMD ["tail", "-f", "/dev/null"]
