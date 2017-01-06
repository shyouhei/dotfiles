#! /bin/zsh

typeset -x ZPLUG_HOME=$ZDOTDIR/zplug
typeset -x ZPLUG_LOADFILE=$ZDOTDIR/plugins.zsh
typeset -x ZPLUG_USE_CACHE=true
typeset -x ZPLUG_CACHE_DIR=$XDG_CACHE_HOME/zplug

source $ZPLUG_HOME/init.zsh

# zplug update --self
zplug check || zplug install
zplug load
