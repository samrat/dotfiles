(defvar blog-dir "/home/samrat/code/samrat.github.com/"
  "Path to blog src")

(defun ecstatic/get-post-file (title)
  "Return the filename for a new post given the TITLE."
  (expand-file-name (format "%s/src/posts/%s-%s.md"
                            blog-dir
                            (format-time-string "%Y-%m-%d")
                            (replace-regexp-in-string "\\W+" "-" title))))


(defun ecstatic/new-post (title)
  "Start a new Ecstatic blog post."
  (interactive "MTitle: ")
  (find-file (ecstatic/get-post-file title))
  (insert "---\n")
  (insert (format "title: %s\n" title))
  (insert (format-time-string "date: %Y-%m-%dT%H:%M:%SZ\n" nil t))
  (insert (format "tags: \n"))
  (insert "---\n\n"))

(defun ecstatic/update-date ()
  "Update the YAML date element to the current time."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (search-forward-regexp "^date: +")
    (kill-line)
    (insert (format-time-string "%Y-%m-%dT%H:%M:%SZ" nil t))))

(provide 'ecstatic)
