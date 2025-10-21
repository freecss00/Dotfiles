# PATH #######################
# for c++
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/Users/freecss/local/competitive/lib/ac-library"

# for java
export JAVA_HOME=/usr/bin/java
export PATH=${JAVA_HOME}/bin:$PATH

# anyenv
if [ -e "$HOME/.anyenv" ]
then
    export ANYENV_ROOT="$HOME/.anyenv"
    export PATH="$ANYENV_ROOT/bin:$PATH"

    if ! [ -f ~/.cache/anyenv.cache ]
    then
        anyenv init - --no-rehash > ~/.cache/anyenv.cache
        zcompile ~/.cache/anyenv.cache
    fi
    source ~/.cache/anyenv.cache
fi
# pyenv
export PATH=$PYENV_ROOT/bin:$PATH
# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# pipenv
export PIPENV_PYTHON=$PYENV_ROOT/shims/python
export PIPENV_VENV_IN_PROJECT=true
# goenv
if ! [ -f ~/.cache/goenv.cache ]
then
    export GOENV_ROOT=$HOME/.anyenv/envs/goenv
    export PATH=$GOENV_ROOT/bin:$PATH

    if which goenv > /dev/null;
    then
        goenv init - --no-rehash > ~/.cache/goenv.cache
        zcompile ~/.cache/goenv.cache
    fi
    source ~/.cache/goenv.cache
    # export PATH=$GOROOT/bin:$PATH
    # export PATH=$PATH:$GOPATH/bin
    export GO111MODULE=on
fi

# for node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH
NODEBREW_HOME=/usr/local/var/nodebrew/current
export NODEBREW_HOME
export NODEBREW_ROOT=/usr/local/var/nodebrew
export PATH=$PATH:$NODEBREW_HOME/bin
# use npm without -g option to install modules.
export PATH=$PATH:./node_modules/.bin

# Substitute gnu-getopt for getopt.
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

# for sage
export SAGE_ROOT="/Applications/SageMath"
export PATH="$PATH:$SAGE_ROOT"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/freecss/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/freecss/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/freecss/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/freecss/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# for mysql
export MYSQL_HOME=/usr/local/opt/mysql
export PATH=${MYSQL_HOME}/bin:$PATH

# for nsq
export NSQ_HOME=/usr/local/opt/nsq
export PATH=${NSQ_HOME}/bin:$PATH

# for mongodb
export PATH=/usr/local/opt/mongodb-community@8.0/bin:$PATH

