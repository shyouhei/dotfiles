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
brew 'ncurses'
brew 'zlib'

brew 'gzip'
brew 'lsof'
brew 'make'
brew 'openssh'
brew 'rsync'

brew 'libpcap'
brew 'tcpdump'

brew 'screen' # build-depends automake -> xz
brew 'tmux'
brew 'cmatrix'

brew 'gnu-time'
brew 'coreutils'
brew 'findutils'
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

brew 'less' # depends pcre

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

brew 'binutils' # gobjdump etc.
brew 'gcc@4.9'
brew 'gcc@5'
brew 'gcc@6'
brew 'gcc'
brew 'llvm'
brew 'llvm@3.7'
brew 'llvm@3.8'
brew 'llvm@3.9'

brew 'ctags'
brew 'global'
brew 'gdb'

brew 'valgrind'
brew 'jemalloc'

# brew 'gimp'

brew 'node'
brew 'homebrew/php/php71'
brew 'python3'
brew 'ghc'

brew 'phantomjs'
brew 'chromedriver'
