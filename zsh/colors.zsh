#! /bin/zsh

function() {
    # default colors for non-coreutils situations
    local ls_colors="fi=00:di=36:ex=32:ln=34:bd=33:cd=33:pi=35:so=35"

    autoload -Uz is-at-least

    has_a dircolors && eval $(dircolors $ZDOTDIR/../dircolors/config)

    if has_a gls; then
        typeset -gx LS_COLORS=${LS_COLORS:-$ls_colors}
        alias ls='gls --color=auto'
    elif has_a colorls; then
        typeset -gx LSCOLORS="exfxcxdxbxegedabagacad"
        alias ls='colorls -G' # for *BSD
    elif \ls --version 2>&1 | \grep 'GNU coreutils' >/dev/null 2>&1; then
        typeset -gx LS_COLORS=${LS_COLORS:-$ls_colors}
        alias ls='ls --color=auto'
    fi

    if has_a pcregrep; then
        alias grep='pcregrep --color=auto'
    elif is-at-least 2.5 `\grep --version | \grep -Eo '([0-9]+\.)+[0-9]+'`; then
        typeset -gx GREP_OPTIONS="$GREP_OPTIONS --color=auto"
    fi

    has_a lv   && typeset -gx LV="-c $LV"
    has_a less && typeset -gx LESS="--raw-control-chars $LESS" # or --RAW-COMTROL-CHARS
}
