#!/bin/sh
export HOSTNAME=`hostname`

compton --config ~/.config/compton/config &
xmodmap -e "clear lock" -e "keysym Caps_Lock = F13"
xmodmap -e "remove Mod1 = Alt_L" -e "add Mod3 = Alt_L"
numlockx on
exec i3
