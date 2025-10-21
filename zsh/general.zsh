autoload colors
colors
autoload compinit
compinit

# Color definition
local DEFAULT=$'%{[m%}'$
local RED=$'%{[1;31m%}'$
local GREEN=$'%{[1;32m%}'$
local YELLOW=$'%{[1;33m%}'$
local BLUE=$'%{[1;34m%}'$
local PURPLE=$'%{[1;35m%}'$
local LIGHT_BLUE=$'%{[1;36m%}'$
local WHITE=$'%{[1;37m%}'$

# Colorizing terminal
# https://github.com/seebi/dircolors-solarized
if [ -f ./dircolors-solarized/dircolors.ansi-universal ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors ./dircolors-solarized/dircolors.ansi-universal)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ./dircolors-solarized/dircolors.ansi-universal)
    fi
fi

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi


# Prompt
PROMPT='%{[38;5;195m%}[%n@%m]# %{[0m%}'
case $OSTYPE in
  # OSX
  darwin*)
    PROMPT='%{[38;5;195m%}[%n@%m]# %{[0m%}'
    ;;
  # GNU/Linux
  linux*)
    PROMPT='%{[38;5;009m%}[%n@%m]# %{[0m%}'
    ;;
esac
RPROMPT='[%d]'

# History
HISTFILE=~/.zsh.history
HISTSIZE=1000000
SAVEHIST=1000000

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
bindkey '^R' history-incremental-search-backward

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
