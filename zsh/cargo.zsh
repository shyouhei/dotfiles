#! /bin/zsh

function() {
    [[ -f "${HOME}/.cargo/env" ]] || return

    . "${HOME}/.cargo/env"
}
