#!/usr/bin/env ruby

# require 'i3ipc'
#
# class I3
#   attr_accessor :i3
#
#   def initialize
#     @i3 = I3Ipc::Connection.new
#   end
#
#   def command(cmd)
#     command = @i3.command(cmd)
#   end
#
# end

def forkoff(command)
  fork do
    exec("#{command}")
  end
end

host = `cat /etc/hostname`
host = host.strip

swallow = "/usr/local/bin/swallow"
output = File.join(ENV["HOME"], '.screenlayout', host)

blocks = File.join(ENV["HOME"], '.config', 'polybar', 'blocks', 'launch.sh')
grayblocks = File.join(ENV["HOME"], '.config', 'polybar', 'blocks', 'launch.sh')


if host == "soundbotMX"
  forkoff("touchpad-indicator &")
  forkoff(output)
  # forkoff('nitrogen --restore')
  sleep 1
  forkoff("#{grayblocks}")
end


if "ninjabot"
  forkoff(output)
  # forkoff('nitrogen --restore')
  sleep 1
  #forkoff("#{polybar} --blocks")
  # forkoff("tilda")
  #forkoff("redshift -c '~/.config/redshift/redshift.conf' &")
end

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

forkoff("#{blocks}")
forkoff("nitrogen --restore")

forkoff("guake")


