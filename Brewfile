#! /bin/bundle
# -*- mode: ruby; coding: utf-8 -*-

# As far as I read the implementation of brew bundle, this file is
# `instane_eval`ed.  Feel free to write any dangerous ruby things
# here.

ENV['HOMEBREW_MAKE_JOBS'] = '5'

tap 'homebrew/bundle'
tap 'homebrew/command-not-found'
tap 'homebrew/dupes'
tap 'homebrew/versions'
tap 'sanemat/font'

# the list is dependency-sorted

brew 'openssl'
brew 'libressl'
brew 'gpg'

brew 'xz'
brew 'pixz'
brew 'pigz'

brew 'gettext'
brew 'readline'
brew 'homebrew/dupes/ncurses'
brew 'homebrew/dupes/zlib'

brew 'homebrew/dupes/gzip'
brew 'homebrew/dupes/lsof'
brew 'homebrew/dupes/make'
brew 'homebrew/dupes/openssh'
brew 'homebrew/dupes/rsync'

brew 'homebrew/dupes/libpcap'
brew 'homebrew/dupes/tcpdump'

brew 'homebrew/dupes/screen' # build-depends automake -> xz
brew 'tmux'
brew 'cmatrix'

brew 'gnu-time'
brew 'coreutils'
brew 'moreutils', args: ['without-parallel']
brew 'parallel', args: ['force'] # works

brew 'cvs'
brew 'subversion', args: ['with-ruby']
# brew 'hg'
# brew 'bzr'
brew 'git', args: %w[
  with-brewed-curl with-brewed-openssl with-brewed-svn
  with-blk-sha1 with-gettext with-pcre
]
brew 'gist'
brew 'hub'

brew 'go'
brew 'ghq'
brew 'docker' # depends golang
brew 'docker-machine'

brew 'gnu-tar'
brew 'gnu-sed'
brew 'gawk'

brew 'jq'
brew 'python'
# brew 'powerline'
brew 'pcre'
brew 'zsh'
brew 'zsh-completions'
brew 'zsh-syntax-highlighting'

brew 'homebrew/dupes/less' # depends pcre

brew 'q'
brew 'sl'
brew 'tree'
brew 'lv'
brew 'nkf'
brew 'wget'
brew 'htop'
brew 'ispell'
brew 'keychain'
brew 'pstree'

brew 'rbenv'
brew 'ruby-build'

# brew 'mysql'
# brew 'memcached'
# brew 'mongodb'
# brew 'rabbitmq'
# brew 'redis'

brew 'emacs', args: ['with-cocoa']
brew 'gnuplot', args: ['with-pdflib-lite', 'with-wxmac']
brew 'graphviz', args: ['with-gts']
brew 'imagemagick'
brew 'ghostscript'
brew 'wireshark'
brew 'ffmpeg'

brew 'sanemat/font/ricty', args: ['powerline']
brew 'reattach-to-user-namespace'

brew 'homebrew/versions/gcc49'
brew 'homebrew/versions/gcc5'
brew 'homebrew/versions/gcc6'
brew 'llvm'
brew 'homebrew/versions/llvm35'
brew 'homebrew/versions/llvm36'
brew 'homebrew/versions/llvm37'
brew 'homebrew/versions/llvm38'

brew 'ctags'
brew 'global'
brew 'gdb'

brew 'valgrind'
brew 'jemalloc'

# brew 'gimp'
