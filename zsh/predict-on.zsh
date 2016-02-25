#! /bin/zsh

autoload -Uz predict-on
predict-on
zle -N predict-on
zle -N predict-off
bindkey "\e^" predict-on # jp-keyboard
bindkey "\e=" predict-on # generic
bindkey "\e-" predict-off
zstyle ':predict' verbose true
