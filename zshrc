# source ~/.zshrc.back

# Includes
[ -f ~/.zsh/general.zsh ] && source ~/.zsh/general.zsh
[ -f ~/.zsh/setopt.zsh ] && source ~/.zsh/setopt.zsh
[ -f ~/.zsh/bindkey.zsh ] && source ~/.zsh/bindkey.zsh
[ -f ~/.zsh/alias.zsh ] && source ~/.zsh/alias.zsh
[ -f ~/.zsh/profile.zsh ] && source ~/.zsh/profile.zsh

case $OSTYPE in #   # OSX
  darwin*)
    [ -f ~/.zsh/osx.zsh ] && source ~/.zsh/osx.zsh;;
  # GNU/Linux
  linux*)
    [ -f ~/.zsh/linux.zsh ] && source ~/.zsh/linux.zsh;;
esac

# profiling zsh
# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi

