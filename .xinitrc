if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

#run systemd as user instance
systemd --user &

dropboxd&
urxvtd&
xbindkeys
dunst&
unclutter&
low-battery-notify&
ctrl-fix

# Random wallpaper each time X starts
find ~/.wallpaper -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
    shuf -n1 -z | xargs -0 feh --bg-max

exec xmonad
