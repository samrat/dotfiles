(map (lambda (binding) (xbindkey (car binding) (cdr binding)))
     (list 
           ;; Volume
           '(XF86AudioRaiseVolume . "amixer set Master playback 2+")
           '(XF86AudioLowerVolume . "amixer set Master playback 2-")
           '(XF86AudioMute . "amixer set Master toggle")
           ;; Music
           '(XF86AudioPlay . "mpc toggle; ~/bin/music-show")
           '(XF86AudioNext . "mpc next; ~/bin/music-show")
           '(XF86AudioPrev . "mpc prev; ~/bin/music-show")
           '((mod4 g) . "~/bin/dmenu-mpd/dmenu-mpd -t")
           '((mod4 b) . "~/bin/show-power")
           
           ;; Lock screen
           '(XF86Calculator . "i3lock && sudo pm-suspend")
	   '((mod4 XF86Calculator) . "i3lock && sudo pm-hibernate")

           ;; Dropbox status
           '((mod4 d) . "~/bin/dropbox-status")
           
           ;; Ncmpcpp
           '((mod4 XF86AudioPlay) . "urxvtc -e bash -c 'ncmpcpp'")

           ;; Print screen
           '(Print . "scrot -e 'mv $f ~/images/'")))
