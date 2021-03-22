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

polybar = File.join(ENV["HOME"], '.config', 'polybar', 'launch.sh')

case host
when "soundbotMX"
  forkoff("touchpad-indicator")
  forkoff(output)
  forkoff('nitrogen --restore')
  sleep 1
  forkoff("#{polybar} --hack")
when "ninjabot"
  forkoff(output)
  forkoff('nitrogen --restore')
  sleep 1
  forkoff("#{polybar} --blocks")
  forkoff("tilda")
end

forkoff("#{swallow} -d python3 $HOME/.config/i3/autotiling.py")
system("notify-send 'starting sound services'")
forkoff("jack_control start")
sleep 0.5
forkoff("a2j_control start")
forkoff("ray_control open_session start")
sleep 1
forkoff("pulseaudio --log-target=syslog --daemonize --high-priority --realtime --exit-idle-time=-1")
forkoff("guake")
