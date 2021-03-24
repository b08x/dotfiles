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

blocks = File.join(ENV["HOME"], '.config', 'polybar', 'blocks', 'launch.sh')
grayblocks = File.join(ENV["HOME"], '.config', 'polybar', 'grayblocks', 'launch.sh')

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

system("notify-send 'starting pulse'")
forkoff("pulseaudio --log-target=syslog --daemonize --high-priority --realtime --exit-idle-time=-1")

unless host == "ninjabot"
  forkoff("touchpad-indicator &")
  sleep 1
  forkoff("#{grayblocks}")
else
  forkoff("#{blocks}")
end

forkoff("nitrogen --restore")

forkoff("guake")
