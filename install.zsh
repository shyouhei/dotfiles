#! /bin/zsh

function check {
    local target=$1
    if [[ -x $target ]]; then
        echo "$target exists; bailing out"
        exit 1
    fi
}

function link {
    if [[ $1 == $2 ]]; then
        return # skip
    elif [[ ! -e $2 ]]; then
        ln -sf $@
    elif [[ -L $2 ]]; then
        ln -sf $@ # silent overwrite
    else
        abort "$2 exists; aborting"
    fi
}

declare -r dir=${${${(%):-%N}:A}:h}
declare -r etc=~/data/etc
declare -r cache=~/data/cache

# check $etc
# check ~/.ssh
# check ~/.emacs.d
# check ~/.zshenv

set -e # any failure after this line are considered fatal.
set -x

link $dir $etc
link $etc ${XDG_CONFIG_HOME:-~/.config}
link $cache ${XDG_CACHE_HOME:-~/.cache}
link $etc/ssh ~/.ssh
link $etc/emacs ~/.emacs.d
link $etc/zsh/zshenv ~/.zshenv
link $etc/bash/init ~/.bashrc
link $etc/bash/init ~/.bash_profile
link $etc/bash/init ~/.bash_login
link $etc/gnuplot/history ~/.gnuplot_history
link $etc/pry/init ~/.pryrc
link $etc/irb/init ~/.irbrc
link $etc/tmux/tmux.conf ~/.tmux.conf
link $etc/tmux ~/.tmux
link $etc/wget/hists ~/.wget-hsts
link $etc/parallel ~/.parallel

# CF: http://stackoverflow.com/questions/32418438
if [[ -d ~/.bash_sessions ]]; then
    rm -rf ~/.bash_sessions
    touch ~/.bash_sessions_disable
fi

# vim complains this directory
mkdir -p $cache/vim
