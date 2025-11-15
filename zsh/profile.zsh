# PATH #######################
# for c++
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$HOME/local/competitive/lib/ac-library"

# for java
export JAVA_HOME=/usr/bin/java
export PATH=${JAVA_HOME}/bin:$PATH

# for mise
if which mise > /dev/null; then eval "$(mise activate bash)"; fi

# # anyenv
# disable anyenv for now. use mise instead.
# if [ -e "$HOME/.anyenv" ]
# then
#     export ANYENV_ROOT="$HOME/.anyenv"
#     export PATH="$ANYENV_ROOT/bin:$PATH"
#
#     if ! [ -f ~/.cache/anyenv.cache ]
#     then
#         anyenv init - --no-rehash > ~/.cache/anyenv.cache
#         zcompile ~/.cache/anyenv.cache
#     fi
#     source ~/.cache/anyenv.cache
# fi

# pyenv
export PATH=$PYENV_ROOT/bin:$PATH
# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# pipenv
export PIPENV_PYTHON=$PYENV_ROOT/shims/python
export PIPENV_VENV_IN_PROJECT=true
# golang
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# for node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH
NODEBREW_HOME=/usr/local/var/nodebrew/current
export NODEBREW_HOME
export NODEBREW_ROOT=/usr/local/var/nodebrew
export PATH=$PATH:$NODEBREW_HOME/bin
# use npm without -g option to install modules.
export PATH=$PATH:./node_modules/.bin
