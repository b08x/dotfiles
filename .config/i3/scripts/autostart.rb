#!/usr/bin/env ruby

def forkoff(command)
  fork do
    exec("#{command}")
  end
end

# /usr/bin/laptop-detect
host = `cat /etc/hostname`
host = host.strip

swallow = "/usr/local/bin/swallow"

forkoff("#{swallow} -d python3 $HOME/.config/i3/autotiling.py")

system("notify-send 'starting sound services'")
forkoff("jack_control start")
sleep 0.5

system("notify-send 'starting raysession'")
forkoff("ray_control open_session start")
sleep 2

system("notify-send 'starting a2jmidid'")
forkoff("a2jmidid -e")
sleep 1

forkoff("nitrogen --restore")
forkoff("tilda")
forkoff("guake")
