#!/bin/sh
# ~/.xinitrc
xset +fp /usr/share/fonts/misc
xset +fp /usr/share/fonts/TTF
#xrdb -merge .Xresources
numlockx
xmodmap ~/.Xmodmap
xcape -e 'Control_L=Escape'
(conky | while read LINE; do xsetroot -name "$LINE"; done) &
exec dwm
