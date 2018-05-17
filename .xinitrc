#!/bin/sh
# ~/.xinitrc
export _JAVA_AWT_WM_NONREPARENTING=1
xset +fp /usr/share/fonts/dejavu
xset +fp /usr/share/fonts/terminus
xrdb -merge .Xresources
numlockx
setxkbmap -option 'caps:ctrl_modifier'
xcape -t 200 -e 'Caps_Lock=Escape'
(conky | while read LINE; do xsetroot -name ";$LINE"; done) &
exec dwm
