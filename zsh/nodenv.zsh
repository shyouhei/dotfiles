#! /bin/zsh

function() {
    has_a nodenv || return

    eval "$(nodenv init -)"
}
