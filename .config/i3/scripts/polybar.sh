#!/usr/bin/env bash

# borrowed from:
# https://github.com/polybar/polybar/issues/763#issuecomment-331604987
# works well

pkill -9 polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload primary &
  done
else
  polybar --reload primary &
fi
