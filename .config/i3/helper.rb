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
#
# hosts = ["lapbot", "ninjabot"]
#
# host = `cat /etc/hostname`
#
# if host == "lapbot"
#   system("synclient PalmDetect=1")
#   system("synclient PalmMinWidth=8"
#   system("synclient PalmMinZ=200")
# end
#
#
# if host == "ninjabot"
#   exec_always --no-startup-id xrandr --output DVI-I-2 --mode 1920x1080 --pos 0x0 --rotate normal
#   $autostart exec
#   $autostart nitrogen --restore
#   $execute 'exec sleep 2 && $swallow -d polybar -r nvidia'
#
#   $execute 'exec deadbeef'
#
# end
