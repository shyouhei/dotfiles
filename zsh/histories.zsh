#! /bin/zsh

typeset -gi LISTMAX=0
typeset -gi HISTSIZE=65536
typeset -gi SAVEHIST=$HISTSIZE
typeset -gr HISTFILE=$ZDOTDIR/history
if [[ $UID = 0 ]]; then
  unset HISTFILE
  SAVEHIST=0
fi
