#! /bin/zsh

function() {
    typeset -Ua editors; editors=(nvim vim vi emacs nano)
    typeset -Ua pagers; pagers=(lv less w3m more)

    # grab default $PATH
    has_a /usr/libexec/path_helper && eval $(env -i PATH=$PATH MANPATH=$MANPATH /usr/libexec/path_helper)

    # (N-/) is handy so $path is set instead of $PATH
    # /sbin etc. are filtered out later.
    typeset -gUa path; path=(
        $HOME/bin(N-/)
        $HOME/Library/Python/*/bin(N-/)
        /usr/texbin(N-/)
        /opt/local/bin(N-/)
        /opt/csw/bin(N-/)
        /usr/sfw/bin(N-/)
        /usr/local/opt/*/libexec/gnubin(N-/)
        /usr/local/bin(N-/)
        /usr/pkg/bin(N-/)
        /usr/X11R6/bin(N-/)
        /usr/bin
        /usr/games(N-/)
        /bin
        /usr/local/sbin(N-/)
        /usr/pkg/sbin(N-/)
        /usr/sbin
        /sbin
        $path
    )
    local sbins="$(filter '[[ $1 =~ sbin ]]' $path | map '$1:A')"
    local bins="$(filter '[[ ! $1 =~ sbin ]]' $path)"

    typeset -gxT SUDO_PATH sudo_path
    typeset -gUa sudo_path; sudo_path=(${(f)sbins})
    path=(${(f)bins})

    typeset -gUa manpath; manpath=(
         /usr/local/opt/*/libexec/gnuman(N-/)
         /opt/local/share/man(N-/)
         /opt/csw/share/man(N-/)
         /usr/sfw/share/man(N-/)
         /usr/local/share/man(N-/)
         /usr/share/man(N-/)
         $manpath
    )

    typeset -gx EDITOR=$(filter 'has_a $@' $editors | head -n1)
    typeset -gx PAGER=$(filter 'has_a $@' $pagers | head -n1)
    typeset -gx CVS_RSH=ssh
    typeset -gx GOPATH=~/data/src
    typeset -gx DOCKER_BUILDKIT=1
}

