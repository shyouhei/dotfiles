#! /bin/zsh

typeset -x ZPLUG_HOME=$ZDOTDIR/zplug
typeset -x ZPLUG_EXTERNAL=$ZDOTDIR/plugins.zsh
typeset -x ZPLUG_USE_CACHE=true

source $ZPLUG_HOME/zplug

# zplug update --self
zplug check || zplug install
zplug load
