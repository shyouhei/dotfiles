#! /bin/zsh

function() {
    if has_a compinit; then; else
	# compinit should have been loaded already by zplug though...
	autoload -Uz compinit
	compinit
    fi

    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
  # zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    zstyle ':completion:*' format "$reset_color$bold_color%d$reset_color"
    zstyle ':completion:*' keep-prefix
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
    zstyle ':completion:*:default' menu select true
    zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
    zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#' '*.swp'
    zstyle ':completion:*:cd:*' ignore-parents parent pwd
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
    #compdef _man w3mman

    autoload -Uz history-search-end
    zle -N history-beginning-search-backward-end history-search-end
    zle -N history-beginning-search-forward-end history-search-end
    bindkey "^p" history-beginning-search-backward-end
    bindkey "^n" history-beginning-search-forward-end

    [[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
}

