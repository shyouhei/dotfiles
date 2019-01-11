#! /bin/zsh

function tmux_fulltitle() {
    tmux new-window -n "$*" env "$@"
}

function ssh_in_tmux() {
    local host=$1
    shift 1

    [[ -z $1    ]] && 1=bash

    tmux new-window -n "$host" ssh -At "$host" "$@"
}

function ghq_in_tmux() {
    case $1 in
        look)
            noglob tmux new-window -n "$2" -- ghq "$@"
            ;;
        *)
            command ghq "$@"
            ;;
    esac
}

function() {
    [[ -n $TMUX ]] || return

    local i
    alias ssh=ssh_in_tmux
    alias ghq=ghq_in_tmux

    compdef _env tmux_fulltitle

    local -a commands=(
        man info w3m \
        htop top \
        emacs emacs-snapshot vim vi nano sudoedit \
        scim \
        gnuplot irb irb1.8 gosh python ghci ocaml
    )
    eval $(filter 'has_a $1' $commands | map 'alias $1="tmux_fulltitle $1"')

    # htop needs sudo
    alias htop="tmux_fulltitle sudo /usr/local/bin/htop"
}
