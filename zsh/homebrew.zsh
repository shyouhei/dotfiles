#! /bin/zsh

function() {
    has_a brew || return

    eval $(brew shellenv)
    mkdir -p $ZDOTDIR/functions
    [[ -h  $ZDOTDIR/functions/_brew ]] || ln -s $(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh $ZDOTDIR/functions/_brew
    autoload -Uz _brew
    brew command command-not-found-init > /dev/null && eval $(brew command-not-found-init)

    typeset -x HOMEBREW_GITHUB_API_TOKEN=$(git config --get github.token)
}
