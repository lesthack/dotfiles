# Editors
export VISUAL=vim
export EDITOR="$VISUAL"

# Virtualenvwrappers
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Android SDK
export ANDROID_HOME=/home/lesthack/.android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/

# Google Flutter
export PATH=$PATH:$HOME/.android/flutter/bin/

# nvm
export NVM_DIR="$HOME/.nvm"
function load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# Mis Utils
export PATH=$PATH:$HOME/code/Utils/

# Go
# export GOPATH=$HOME/.go
# export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# mssql tools
# export PATH="$PATH:/opt/mssql-tools/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/home/lesthack/.sdkman"
#[[ -s "/home/lesthack/.sdkman/bin/sdkman-init.sh" ]] && source "/home/lesthack/.sdkman/bin/sdkman-init.sh"
#export GPG_TTY=$(tty)

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
alias ssh_maices="ssh jhernandez@maices.com -p 2222"
alias ssh_BugMaster="ssh lesthack@192.168.16.100"
alias tmux="tmux -u"
alias adb_wifi="adb kill-server & adb tcpip 5555 & adb shell ifconfig & echo 'Use: adb connect ip:5555'"
alias ls="ls -l"
alias diskusage="df -h"
alias folderusage="du -ch"
alias totalfolderusage="du -sh"
alias totalusage="ncdu"
