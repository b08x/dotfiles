# sway stuff

combo  |  action
--|--
$mod+  |  
$mod+  |  
$mod+  |  
$mod+  |  
$mod+  |  
$mod+  |  
$mod+  |  
$mod+  |  
$mod+  |  

# ࿓࿓


# aliases

- alias wmic="zita-a2j -j 'wmic' -d 'hw:Headset,0' -c 1"
- alias powermic="zita-a2j -j 'powermic' -d 'hw:PowerMicIINS' -c 1"
- alias cammic="zita-a2j -j 'cammic' -d 'hw:CinemaTM' -c 1"
- alias speechmike="zita-a2j -j speechmike -d hw:4 -r 22050 -c 1"
- alias headphones="zita-j2a -j 'headphones' -d 'hw:Headset'"
- alias start="jack_control start && a2j_control start"
- alias pulse="pulseaudio --start"
- alias killpulse="pulseaudio --kill"
- alias listinputs="sudo libinput list-devices"
- alias stoppulse="systemctl --user stop pulseaudio.service && systemctl --user stop pulseaudio.socket"
- alias startpulse="systemctl --user start pulseaudio.service"
- alias h="history"
- alias cp="cp -i"                          # confirm before overwriting something
- alias mv="mv -i"                          # confirm before overwriting something
- alias df='df -h'                          # human-readable sizes
- alias free='free -m'                      # show sizes in MB
- alias np='nano -w PKGBUILD'
- alias more=less
- alias ls='lsd'
- alias ll='lsd -lah'
- alias nocomment='grep -v "^\($\|#\)"'
- alias service='sudo systemctl'
- alias checklog='sudo journalctl | lnav'
- alias taillog='sudo journalctl -f | lnav'
- alias fileperms="find . -type f -exec chmod 0664 {} +"
- alias dirperms="find . -type d -exec chmod 2775 {} +"
- alias h="history"
- alias cp="cp -i"                          # confirm before overwriting something
- alias mv="mv -i"                          # confirm before overwriting something
- alias df='df -h'                          # human-readable sizes
- alias free='free -m'                      # show sizes in MB
- alias np='nano -w PKGBUILD'
- alias more=less
- alias ls='lsd'
- alias ll='lsd -lah'
- alias nocomment='grep -v "^\($\|#\)"'
- alias service='sudo systemctl'
- alias checklog='sudo journalctl | lnav'
- alias taillog='sudo journalctl -f | lnav'
- alias fileperms="find . -type f -exec chmod 0664 {} +"
- alias dirperms="find . -type d -exec chmod 2775 {} +"
- # alias topydo="topydo -c ~/.todo/topydo.conf"
- # alias todo="topydo columns -l ~/.todo/topydo_columns.conf"
- alias install="pamac install"
- alias info="pamac info"
- alias search="pacman -Ss"
- alias st="git status"
- alias cat="bat"
- alias ping="sudo ping"
- #alias source="cd '$HOME/Downloads/source'"
- #alias wkspace="cd '$HOME/Workspace'"
