#! /bin/zsh

function() {
    local editor pager

    # (N-/) is handy so $path is set instead of $PATH
    typeset -gUa path=(
	$HOME/bin(N-/)
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
	$path
    )

    typeset -gxT SUDO_PATH sudo_path
    typeset -gUa sudo_path=(
	/usr/local/sbin(N-/)
	/usr/pkg/sbin(N-/)
	/usr/sbin
	/sbin
    )

    typeset -gUa manpath=(
         /opt/local/share/man(N-/)
         /opt/csw/share/man(N-/)
         /usr/sfw/share/man(N-/)
         /usr/local/share/man(N-/)
         /usr/share/man(N-/)
	 $manpath
    )

    for editor in vim vi emacs nano; do
	if has_a $editor; then
	    typeset -gx EDITOR=$editor
	    break
	fi
    done

    for pager in lv less w3m more; do
	if has_a $pager; then
	   typeset -gx PAGER=$pager
	   break
	fi
    done

    typeset -gx CVS_RSH=ssh
}

