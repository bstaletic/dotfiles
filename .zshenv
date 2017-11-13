[[ -z $DISPLAY ]] && export BROWSER=links
[[ -n $DISPLAY ]] && export BROWSER=qutebrowser
export LESS="-FRXE"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_TEMPLATES_DIR="$HOME/Temp"
export XDG_VIDEOS_DIR="$HOME/Movies"
export PS1="%B%F{blue}%n%f%b@%m %B%40<..<%1~%<< %b%# "
export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
