# Version: 0.0.1
FROM ubuntu:latest
MAINTAINER duer "duerzy@gmail.com"
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y npm
RUN mkdir -p /root/.vim/autoload ~/.vim/bundle && curl -LSso /root/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN cd /root/.vim/bundle && git clone git://github.com/tpope/vim-surround.git
RUN cd /root/.vim/bundle && git clone git://github.com/tpope/vim-repeat.git
RUN cd /root/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git
RUN cd /root/.vim/bundle && git clone git://github.com/msanders/snipmate.vim.git
RUN cd /root/.vim/bundle && git clone https://github.com/scrooloose/syntastic.git
RUN cd /root/.vim/bundle && git clone https://github.com/isRuslan/vim-es6.git
RUN npm config set strict-ssl false
RUN npm install -g jshint --registry=https://registry.npm.taobao.org --cache=/root/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist
RUN cd /root/.vim/bundle && git clone https://github.com/wookiehangover/jshint.vim
RUN touch /root/.jshintrc
RUN echo "{\"esnext\": true}" | tee -a /root/.jshintrc
ADD .vimrc /root/.vimrc
ADD .gvimrc /root/.gvimrc
