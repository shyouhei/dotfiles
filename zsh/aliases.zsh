#! /bin/zsh

zmodload zsh/files
autoload -Uz zmv
alias zmv='noglob zmv -W'
alias zcp='noglob zmv -W -C'
alias zln='noglob zmv -W -L'

# vim-ish
alias :q='exit'
alias :e=$EDITOR

case $(whence lldb) in
    /usr/bin/lldb)
	alias lldb='env PATH=/usr/bin:$PATH lldb'
	;;
esac
