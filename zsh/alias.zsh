alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias emacs=vim
alias gdb='gdb -q'

autoload -Uz zmv
alias zmv='noglob zmv -W'
case $OSTYPE in
  # OSX
  darwin*)
    alias vim='vim -v'
    ;;
esac

cd () {
  builtin cd "$@" && ls
}
