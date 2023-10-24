#! /bin/zsh

function() {
    has_a direnv || return

    eval "$(direnv hook zsh)"
}
