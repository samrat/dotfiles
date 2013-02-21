(require 'org-latex)
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (list (concat org-directory "/projects.org")
                             (concat org-directory "/home.org")))

(setq org-default-notes-file (concat org-directory "/notes.org"))

(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(setq org-startup-indented t)
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

(setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))

;; regular normal state shortcuts.
(require 'evil)

(evil-declare-key 'normal org-mode-map
  "gh" 'outline-up-heading
  "gj" 'org-forward-same-level
  "gk" 'org-backward-same-level
  "gl" 'outline-next-visible-heading
  "H" 'org-beginning-of-line
  "L" 'org-end-of-line
  "t" 'org-todo
  "$" 'org-end-of-line
  "^" 'org-beginning-of-line
  "-" 'org-ctrl-c-minus
  "<" 'org-metaleft
  ">" 'org-metaright)

(provide 'samrat-org)
