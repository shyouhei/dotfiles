#! /bin/zsh

function() {
    has_a mise || return

    eval "$(mise activate zsh)"
}
