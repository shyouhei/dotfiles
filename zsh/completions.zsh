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
    zstyle ':completion:*' format '%B%d%b'
    zstyle ':completion:*' keep-prefix
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*:default' menu select true
    zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

    #compdef _man w3mman

    autoload -Uz history-search-end
    zle -N history-beginning-search-backward-end history-search-end
    zle -N history-beginning-search-forward-end history-search-end
    bindkey "^p" history-beginning-search-backward-end
    bindkey "^n" history-beginning-search-forward-end

    [[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
}

