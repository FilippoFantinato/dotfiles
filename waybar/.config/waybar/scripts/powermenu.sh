#!/bin/bash

entries="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|rofi -dmenu -no-fixed-num-lines -theme-str 'mainbox {children: [listview];}' --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    pkill -u kia;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff;;
    # it used to be poweroff -i
esac
