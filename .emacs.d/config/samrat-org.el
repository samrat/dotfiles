(require 'org-latex)
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (list (concat org-directory "/projects.org")
                             (concat org-directory "/home.org")))
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n %i\n %a")
        ("m" "Media" entry (file "~/org/media.org" "Media")
         "* TODO %?\n %i\n %a")
        ("j" "Journal" entry (file+datetree
                              "~/org/journal.org") "* %?\nEntered on %U\n  %i\n  %a")))
(setq org-log-done t)
(setq org-startup-indented t)

;; 'djcb-org-article' for export org documents to the LaTex 'article', using
;; XeTeX and some fancy fonts; requires XeTeX (see org-latex-to-pdf-process)
(add-to-list 'org-export-latex-classes
  '("article"
"\\documentclass[11pt,a4paper]{article}
\\usepackage[T1]{fontenc}
\\usepackage{fontspec}
\\usepackage{graphicx} 
\\defaultfontfeatures{Mapping=tex-text}
\\setmonofont[Scale=0.8]{DejaVu Sans Mono}
\\usepackage{geometry}
\\title{}
      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-to-pdf-process 
  '("xelatex -interaction nonstopmode %f"
    "xelatex -interaction nonstopmode %f")) ;; for multiple passes

(provide 'samrat-org)
