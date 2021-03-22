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

case host
when "soundbotMX"
  system("touchpad-indicator")
  system(output)
  system('nitrogen --restore')
  sleep 1
  fork do
      exec("#{swallow} -d polybar -r laptop")
  end
when "ninjabot"
  polybars = ["#{swallow} -d polybar -r landscape", "#{swallow} -d polybar -r portait"]

  system(output)

  system('nitrogen --restore')

  sleep 1

  polybars.each do
    forkoff(polybar)
  end

  forkoff("tilda")
end



forkoff("#{swallow} -d python3 $HOME/.config/i3/autotiling.py")

system("notify-send 'starting sound services'")
forkoff("ray_control open_session start")
sleep 1
forkoff("a2j_control start")
forkoff("pulseaudio --log-target=syslog --daemonize --high-priority --realtime --exit-idle-time=-1")

forkoff("guake")
