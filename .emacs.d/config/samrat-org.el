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
   (scheme . t)
   (python . t)))

(setq org-confirm-babel-evaluate nil)
(setq org-src-window-setup 'current-window)

(eval-after-load "ob-clojure"
  '(defun org-babel-execute:clojure (body params)
     "Execute a block of Clojure code with Babel and nREPL."
     (require 'nrepl)
     (let ((result (nrepl-eval (org-babel-expand-body:clojure body params))))
       (car (read-from-string (plist-get result :value))))))

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-to-pdf-process (list "pdflatex %f"))

(defvar blog-directory "/home/samrat/code/samrat.github.com/src/posts"
  "Path to blog src")

(defun new-post (title)
  "Create and visit a new .org file in dir named $date-$title.org, ie
Octopress/Jekyll style"
  (interactive "sPost title: ")
  (let* ((date (format-time-string "%Y-%m-%d"))
         (title-no-spaces (replace-regexp-in-string " +" "-" (downcase title)))
         (dirname (file-name-as-directory blog-directory))
         (filename (format (concat dirname "%s-%s.org") date title-no-spaces)))
    (find-file filename)
    (rename-buffer title)
    ;;(org-insert-export-options-template)
    (rename-buffer filename)))

(defun insert-current-date () (interactive)
    (insert (shell-command-to-string "date --rfc-822")))

(provide 'samrat-org)
