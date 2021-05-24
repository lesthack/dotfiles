alias tmux="tmux -u"
alias ls="ls -l"
alias ifconfig='ip -c a'
alias me_adb_wifi="adb kill-server & adb tcpip 5555 & adb shell ifconfig & echo 'Use: adb connect ip:5555'"
alias me_python_server="python -m SimpleHTTPServer 8000"
alias me_mix_activate="pactl load-module module-null-sink sink_name=duplex_out;pactl load-module module-null-sink sink_name=game_out;pactl load-module module-loopback source=game_out.monitor;pactl load-module module-loopback source=game_out.monitor sink=duplex_out;"
alias me_mix_deactivate="pactl unload-module module-null-sink;pactl unload-module module-loopback"
alias me_miwebcam="mplayer -ontop -noborder -geometry 320x240+1600+840 -tv driver=v4l2:width=320:height=240:device=/dev/video0 tv://"
alias me_miwebcam2="mplayer -ontop -noborder -geometry 240x240+1600+840 -tv driver=v4l2:width=240:height=240:device=/dev/video0 tv://"
alias me_mobile_show="snap run scrcpy"
alias me_change_wallpaper="~/code/others/autowallpaper_unsplash.sh"
alias me_diskusage="df -h"
alias me_folderusage="du -ch"
alias me_totalfolderusage="du -sh"
alias me_totalusage="ncdu"
alias me_checkspace="df -h .; du -h --max-depth=1 | sort -hr"
alias me_bajarmp3="youtube-dl -x --add-metadata --embed-thumbnail --audio-format mp3"
alias me_restart_bluetooth="sudo service bluetooth restart && killall wingpanel"
alias me_colorscheme='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias me_v412loopback="sudo modprobe v4l2loopback exclusive_caps=1"
