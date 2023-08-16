# Editors
export VISUAL=vim
export EDITOR="$VISUAL"

# Dotfiles
export PATH_DOTFILES=$HOME/.dotfiles/
export ALIASES=$PATH_DOTFILES/.bash_aliases

# Virtualenvwrappers
export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# Android SDK
export ANDROID_HOME=$HOME/.android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/

# Google Flutter
export PATH=$PATH:$HOME/.android/flutter/bin/

# nvm
export NVM_DIR="$HOME/.nvm"
function load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# Go
export GOPATH=$HOME/.go
if [ -f /usr/local/go/bin/go ]; then
  export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
fi

# gnvim
if [ -f /opt/gnvim/runtime ]; then
  export GNVIM_RUNTIME_PATH=/opt/gnvim/runtime cargo run
fi

# Rust
#source "$HOME/.cargo/env"

# mssql tools
if [ -d /opt/mssql-tools/bin ]; then
  export PATH="$PATH:/opt/mssql-tools/bin"
fi
# Microsoft MSSQL
if [ -d /opt/mssql-tools/bin/ ]; then
  export PATH=$PATH:/opt/mssql-tools/bin/
fi

# Alias
source $ALIASES

# Sensible
KEY="086F0C06"
if [ ! -f  /usr/bin/gpg ]; then
  echo '(sensible) Please, install gpg \nsudo apt-get install gpg'
else
  export SENSIBLE_FILE=$PATH_DOTFILES/.bash_sensible
  if [ -f $SENSIBLE_FILE ]; then
    source $SENSIBLE_FILE
  else
    if [ -f $SENSIBLE_FILE.gpg ]; then
      if [[ $( gpg --list-keys | grep $KEY ) ]]; then
        gpg --decrypt-files $SENSIBLE_FILE.gpg
      else
        echo "(sensible) You need import the gpg key: $KEY"
      fi
    else
      echo "(sensible) $SENSIBLE_FILE.gpg not found"
    fi
  fi
fi
