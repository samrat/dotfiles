(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (list org-directory))

(define-key global-map "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "todo.org" "Unsorted") "* TODO %i%?")
        ("n" "Notes" entry (file+headline "notes.org" "Notes") "** %? ")
        ("j" "Journal" entry (file+datetree "journal.org") "* %i%?")
        ("w" "" entry ;; 'w' for 'org-protocol'
         (file+headline "notes.org" "Conkeror")
         "* %^{Title}\n\n  Source: %u, %c\n\n  %i")))

(setq org-log-done t)
(setq org-startup-indented t)

(setq org-refile-targets `((,(concat "~" (user-login-name)
                                     "/org/todo.org") . (:level . 1))))

;; Org -> Markdown
;; M-x org-export-generic M
(require 'org-export-generic)
(org-set-generic-type
 "Markdown" 
 '(:file-suffix     ".markdown"
   :key-binding     ?M
   :title-format    "Title: %s\n"
   :date-format     "Date: %s\n"
   :toc-export      nil
   :author-export   nil
   :tags-export     nil
   :drawers-export  nil
   :date-export     t
   :timestamps-export  t
   :priorities-export  nil
   :todo-keywords-export t
   :body-line-fixed-format "\t%s\n"
   ;:body-list-prefix "\n"
   :body-list-format "- %s"
   :body-list-suffix "\n"
   :header-prefix ("" "" "### " "#### " "##### " "###### ")
   :body-section-header-prefix ("" "" "### " "#### " "##### " "###### ")
   :body-section-header-format "%s\n"
   :body-section-header-suffix (?= ?- "")
   :body-header-section-numbers nil
   :body-header-section-number-format "%s) "
   :body-line-format "%s\n"
   :body-newline-paragraph "\n"
   :bold-format "**%s**"
   :italic-format "_%s_"
   :verbatim-format "`%s`"
   :code-format "`%s`"
   :body-line-wrap   75
   ))

(provide 'samrat-org)
