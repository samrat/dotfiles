(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

(require 'mu4e)

;; general settings
(setq mu4e-html2text-command "html2text -width 72"
      mu4e-confirm-quit nil ; just quit
      mu4e-get-mail-command "offlineimap"
      mu4e-show-images t)

(setq mu4e-maildir "~/.mail")
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

(setq mu4e-maildir-shortcuts
      '( ("/INBOX"               . ?i)
         ("/[Gmail].Sent Mail"   . ?s)
         ("/[Gmail].Trash"       . ?t)
         ("/[Gmail].All Mail"    . ?a)))

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
