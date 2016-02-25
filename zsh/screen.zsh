#! /bin/zsh

function screen_fulltitle() {
    screen -t "$*" env "$@"
}

function ssh_in_screen() {
    local term host

    case $1 in
	-T)
	    term=$2
	    host=$3
	    shift 3
	    ;;
	*)
	    host=$1
	    shift 1
	    ;;
    esac
    [[ -z $1    ]] && 1=bash
    [[ -z $term ]] && term='xterm-256color' #default

    screen -T "$term" -t "$host" ssh -At "$host" "$@"
}

function() {
    [[ -n $WINDOW ]] || return

    local i
    alias ssh=ssh_in_screen

    compdef _env screen_fulltitle

    for i in \
	man info w3m \
	htop top \
	sudo \
	emacs emacs-snapshot vim vi nano sudoedit \
	scim \
	gnuplot irb irb1.8 gosh python ghci ocaml
    do
	has_a $i && alias $i="screen_fulltitle $i"
    done

    # htop needs sudo
    alias htop="screen_fulltitle sudo /usr/local/bin/htop"
}
