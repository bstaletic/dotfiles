#!/bin/sh
# ~/.xinitrc
xset +fp /usr/share/fonts/misc 
xset +fp /usr/share/fonts/TTF 
xrandr --size 1280x800
xrdb -merge .Xresources
(conky | while read LINE; do xsetroot -name "$LINE"; done) &
exec dwm
