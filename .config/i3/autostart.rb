#!/usr/bin/env ruby

require 'i3ipc'

class I3
  attr_accessor :i3

  def initialize
    @i3 = I3Ipc::Connection.new
  end

  def command(cmd)
    command = @i3.command(cmd)
  end

end

host = `cat /etc/hostname`
swallow = "/usr/local/bin/swallow"
output = File.join(ENV["HOME"], '.screenlayout', '#{host}.sh')

host = host.strip

case host
when "soundbotMX"
  system("synclient PalmDetect=1")
  system("synclient PalmMinWidth=8")
  system("synclient PalmMinZ=200")#
  system(output)
  system('nitrogen --restore')
  sleep 2
  system("#{swallow} -d polybar -r laptop")
when "ninjabot"
  system(output)
  system('nitrogen --restore')
  sleep 2
  system("#{swallow} -d polybar -r landscape")
  system("#{swallow} -d polybar -r portait")
  system("tilda")
end

system("#{swallow} -d python3 $HOME/.config/i3/autotiling.py")

system("ray_control open_session start")
sleep 1
system("a2j_control start")
system("pulseaudio --log-target=syslog --daemonize --high-priority --realtime --exit-idle-time=-1")

system("guake")
