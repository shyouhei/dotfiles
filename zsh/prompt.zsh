#!/bin/zsh

function _precmd_hardstatus () {
    [[ -t 1 ]] || return
    case $TERM in
    *xterm*|rxvt|(dt|k|E)term|screen*)
        print -Pn "\e]0;%n@%m"
#       print -Pn "\e]0;%n@%m:%48<...<%~\a"
        vcs_info
        if [ ! -z ${vcs_info_msg_0_} ]
	then
	    print -Pn "\${vcs_info_msg_1_}\${vcs_info_msg_2_}\a"
	else
            print -Pn ":%64<...<%~\a"
	fi
    ;;
    esac
}

function () {
    autoload -Uz vcs_info add-zsh-hook colors
    zstyle ':vcs_info:*' enable git svn
    zstyle ':vcs_info:git*' formats "%s" "::%s (%r @ %b) /%S" "%m%u%c" "%r" "%b"
    zstyle ':vcs_info:git*' actionformats "%s" "::%s (%r @ %b) /%S" "%a%m%u%c" "%r" "%b"
    zstyle ':vcs_info:git*' stagedstr "STAGED"
    zstyle ':vcs_info:git*' unstagedstr "UNSTAGED"
    zstyle ':vcs_info:git*' git-revision true
    zstyle ':vcs_info:git*' check-for-changes true
    zstyle ':vcs_info:git*' max-exports 32

    colors
    add-zsh-hook precmd _precmd_hardstatus

    typeset    open="[%{$bold_color%}"
    typeset    close="%{$reset_color%}]"
    typeset    start=""
    typeset    caution="%{$bg[red]$fg[white]$bold_color%}"
    typeset    end="%{$reset_color%}%E"
    typeset    user="${open}%{$fg[blue]%}%n${close}"
    typeset    host="${open}%{$fg[red]%}%m${close}"
    typeset    root="${open}${caution}CAUTION!!! ROOT JOB ON A ZSH${close}"
    typeset    tty="${open}%{$fg[green]%}%l${close}"
    typeset    now="${open}%{$fg[white]%}%D{%Y/%b/%d(%a) %H:%M:%S %Z}${close}"
    typeset    lvl="%(2L/${open}%{$fg[blue]%}SHLVL %L${close}/)"
    typeset    vcs="\${vcs_info_msg_0_:+\"$open%{$fg[magenta]%}\$vcs_info_msg_0_${close}\"}"
    typeset    bit="\${vcs_info_msg_2_:+\"$open$caution\$vcs_info_msg_2_${close}\"}"
    typeset    repo="\${vcs_info_msg_3_:+\"$open%{$fg[blue]%}\$vcs_info_msg_3_${close}\"}"
    typeset    branch="\${vcs_info_msg_4_:+\"$open%{$fg[cyan]%}\$vcs_info_msg_4_${close}\"}"
    typeset    screen=${WINDOW:+"$open%{$fg[yellow]%}screen#${WINDOW}${close}"}
    typeset    others="${bit}${branch}${repo}${vcs}${user}${host}${tty}${lvl}${screen}${now}"
    typeset -g POSTEDIT=$reset_color
    typeset -g PROMPT="${start}zsh %S%B%#%b%s${end} "
    typeset -g PROMPT2="${start}zsh ${caution}>${end} "
    typeset -g RPROMPT2="${start}< %U%1_%u%(2_| ...|)${end}"
    typeset -g SPROMPT="${start}zsh: replace '%B%R%b' to '%B%r%b' ? [%Uy%ues/%Un%uo/%Ua%ubort/%Ue%udit] :${end} "
    typeset -g RPROMPT=$(printf "%s%%(!\n%s\n%s)%s" "$start" "$root" "$others" "$end")
}

# function {
#     has_a powerline-daemon || return
#     local pip_root=$(
# 	pip show powerline-status 2>/dev/null |
# 	    fgrep -i location |
# 	    awk '{ print $2 }'
#     )

#     powerline-daemon -q
#     source $pip_root/powerline/bindings/zsh/powerline.zsh
# }
