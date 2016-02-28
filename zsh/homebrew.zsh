#! /bin/zsh

function() {
    has_a brew || return

    mkdir -p $ZDOTDIR/functions
    [[ -h  $ZDOTDIR/functions/_brew ]] || ln -s $(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh $ZDOTDIR/functions/_brew
    autoload -Uz _brew
}
