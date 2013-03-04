(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

(require 'mu4e)
(setq
 mu4e-maildir       "~/.mail"     ;; top-level Maildir
 mu4e-sent-folder   "/samratme/Sent"       ;; folder for sent messages
 mu4e-drafts-folder "/samratme/Drafts"     ;; unfinished messages
 mu4e-trash-folder  "/samratme/trash"      ;; trashed messages
 mu4e-refile-folder "/samratme/archive"    ;; saved messages
 mu4e-get-mail-command "offlineimap"
 mu4e-show-images t )

(require 'smtpmail)
;; outgoing
(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program   "/usr/bin/msmtp"
      smtpmail-default-smtp-server "smtp.zoho.com"
      smtpmail-smtp-server "smtp.zoho.com"
      smtpmail-smtp-service 465
      user-mail-address "samrat@samrat.me"
      user-full-name  "Samrat Man Singh"
      message-kill-buffer-on-exit t
      mu4e-update-interval 1800)

(provide 'samrat-mail)
