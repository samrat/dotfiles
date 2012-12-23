if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

#run systemd as user instance
systemd --user &

dropboxd&
xbindkeys
dunst&
~/bin/low-battery-notify&

exec xmonad
