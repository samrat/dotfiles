(map (lambda (binding) (xbindkey (car binding) (cdr binding)))
     (list 
           ;; Volume
           '(XF86AudioRaiseVolume . "amixer set Master playback 2+")
           '(XF86AudioLowerVolume . "amixer set Master playback 2-")
           '(XF86AudioMute . "amixer set Master toggle")
           ;; Play/pause
           '(XF86AudioPlay . "mpc toggle")
           '(XF86AudioNext . "mpc next")
           '(XF86AudioPrev . "mpc prev")))
