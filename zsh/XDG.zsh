#! /bin/zsh

# XDG related tweaks
# CF https://wiki.archlinux.org/index.php/XDG_Base_Directory_support#Partial

typeset -gx PERLBREW_HOME=$XDG_CONFIG_HOME/perlbrew
typeset -gx RBENV_ROOT=$XDG_CONFIG_HOME/rbenv
typeset -gx INPUTRC=$XDG_CONFIG_HOME/readline/inputrc

typeset -gx LESSHISTFILE=$XDG_CACHE_HOME/less/history
typeset -gx GEM_SPEC_CACHE=$XDG_CACHE_HOME/rubygems/cache

typeset -gx VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
