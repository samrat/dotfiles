(setq org-directory "~/Dropbox/notes")
(setq org-agenda-files (list org-directory))

(define-key global-map "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "todo.org" "Unsorted") "* TODO %i%?")
        ("n" "Notes" entry (file+headline "notes.org" "Notes") "** %? ")
        ("j" "Journal" entry (file+datetree "journal.org") "* %i%?")))

(setq org-log-done t)
(setq org-startup-indented t)

(setq org-refile-targets `((,(concat "~" (user-login-name)
                                     "/org/todo.org") . (:level . 1))))

;; Deft
(when (require 'deft nil 'noerror)
  (setq
     deft-extension "org"
     deft-directory "~/Dropbox/notes/"
     deft-text-mode 'org-mode))

(setq org-src-fontify-natively t)
(require 'htmlize)

(require 'ob)
(require 'ob-tangle)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((clojure . t)
   (scheme . t)))

(setq org-src-window-setup 'current-window)

(eval-after-load "ob-clojure"
  '(defun org-babel-execute:clojure (body params)
     "Execute a block of Clojure code with Babel and nREPL."
     (require 'nrepl)
     (let ((result (nrepl-eval (org-babel-expand-body:clojure body params))))
       (car (read-from-string (plist-get result :value))))))

(require 'org-latex)
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-to-pdf-process (list "latexmk -f -pdf %f"))

(setq org-publish-project-alist
      '(
        ( "org-blog"
          :base-directory "~/notes/blog"
          :base-extension "org"
          :publishing-directory "/tmp"
          :recursive t
          :publishing-function org-publish-org-to-html
          :html-extension "html"
          :body-only t
          :style-include-scripts nil
          :style nil
          :style-extra nil)
        ("blog" :components ("org-blog")))
      )

(provide 'samrat-org)
