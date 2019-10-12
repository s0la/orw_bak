#!/bin/bash

#nmcli device wifi connect s0la\ WiFi

path=~/.orw/scripts

$path/wallctl.sh -r
$path/barctl.sh -b bar1 -d
$path/manage_wallpaper.sh -r
#$path/volume_notification.sh &

#compton --config /dev/null &

xset s off -dpms
xset s blank
xset s 1500

compton &

mpd &
