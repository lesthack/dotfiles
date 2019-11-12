# Editors
export VISUAL=vim
export EDITOR="$VISUAL"

# Dotfiles
export PATH_DOTFILES=$HOME/.dotfiles/

# Virtualenvwrappers
export WORKON_HOME=$HOME/.virtualenvs
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
if [ -d /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
fi

# mssql tools
if [ -d /opt/mssql-tools/bin ]; then
  export PATH="$PATH:/opt/mssql-tools/bin"
fi

# Alias
alias python_server="python -m SimpleHTTPServer 8000"
alias cdboxs="cd ~/code/boxs/"
alias mix_activate="pactl load-module module-null-sink sink_name=duplex_out;pactl load-module module-null-sink sink_name=game_out;pactl load-module module-loopback source=game_out.monitor;pactl load-module module-loopback source=game_out.monitor sink=duplex_out;"
alias mix_deactivate="pactl unload-module module-null-sink;pactl unload-module module-loopback"
alias miwebcam="mplayer -ontop -noborder -geometry 320x240+1600+840 -tv driver=v4l2:width=320:height=240:device=/dev/video0 tv://"
alias miwebcam2="mplayer -ontop -noborder -geometry 240x240+1600+840 -tv driver=v4l2:width=240:height=240:device=/dev/video0 tv://"
alias checkspace="df -h .; du -h --max-depth=1 | sort -hr"
alias mobile_show="snap run scrcpy"
alias change_wallpaper="~/code/others/autowallpaper_unsplash.sh"
alias tmux="tmux -u"
alias adb_wifi="adb kill-server & adb tcpip 5555 & adb shell ifconfig & echo 'Use: adb connect ip:5555'"
alias ls="ls -l"
alias diskusage="df -h"
alias folderusage="du -ch"
alias totalfolderusage="du -sh"
alias totalusage="ncdu"

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
