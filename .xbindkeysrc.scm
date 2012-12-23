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
           '((mod4 g) . "~/bin/music-choose")))
