(require 'erc)

(setq erc-prompt ">"
      erc-hide-list '("NICK" "JOIN" "LEAVE" "QUIT" "PART")
      erc-track-exclude-types (append erc-hide-list '(
                                                     "301"   ; away notice
                                                     "305"   ; return from awayness
                                                     "306"   ; set awayness
                                                     "324"   ; modes
                                                     "329"   ; channel creation date
                                                     "332"   ; topic notice
                                                     "333"   ; who set the topic
                                                     "353"   ; Names notice
                                                     ))
      erc-fill-column 75
      erc-header-line-format nil
      erc-lurker-threshold-time 3600
      erc-track-priority-faces-only t
      erc-join-buffer 'bury
      erc-autojoin-timing :ident
      erc-flood-protect nil
      erc-server-send-ping-interval 45
      erc-server-send-ping-timeout 180
      erc-server-reconnect-timeout 60
      erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#clojure"))
      erc-prompt-for-nickserv-password nil)

(eval-after-load 'erc
  '(progn
     (when (not (package-installed-p 'erc-hl-nicks))
       (package-install 'erc-hl-nicks))
     (when (not (package-installed-p 'ercn))
       (package-install 'ercn))
     (require 'erc-spelling)
     (require 'erc-services)
     (require 'erc-truncate)
     (require 'erc-hl-nicks)
     (require 'notify)
     (erc-services-mode 1)
     (erc-truncate-mode 1)
     (setq erc-complete-functions '(erc-pcomplete erc-button-next))
     (setq-default erc-ignore-list '("Lajla" "hal" "wingy"))
     (add-to-list 'erc-modules 'hl-nicks)
     (add-to-list 'erc-modules 'spelling)
     (set-face-foreground 'erc-input-face "dim gray")
     (set-face-foreground 'erc-my-nick-face "blue")
     (add-hook 'ercn-notify 'ercn-send-notification)))

(defun ercn-send-notification (nick message)
  (notify (concat nick " said:") message))

(provide 'samrat-erc)
