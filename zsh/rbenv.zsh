#! /bin/zsh

function() {
    has_a rbenv || return

    eval "$(rbenv init - zsh)"
    path=(
        $path
        $HOME/.rbenv/plugins/ruby-build/bin(N-/)
    )
}
