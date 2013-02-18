(evil-mode 1)

(require 'evil-leader)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "g" 'magit-status
  "e" 'projectile-find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)
