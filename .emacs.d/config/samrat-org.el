(require 'org-latex)
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (list org-directory))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "todo.org" "Unsorted") "* TODO %i%?")
        ("n" "Notes" entry (file+headline "notes.org" "Notes") "** %? ")
        ("j" "Journal" entry (file+datetree "journal.org") "* %i%?")))

(setq org-log-done t)
(setq org-startup-indented t)

(setq org-refile-targets `((,(concat "~" (user-login-name)
                                     "/org/todo.org") . (:level . 1))))

(provide 'samrat-org)
