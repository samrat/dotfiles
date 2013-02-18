(evil-mode 1)

(require 'evil-leader)
(require 'evil-nerd-commenter)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "g" 'magit-status
  "e" 'projectile-find-file
  "b" 'switch-to-buffer
  "ci" 'evilnc-comment-or-uncomment-lines
  "cc" 'evilnc-comment-or-uncomment-to-the-line
  "k" 'kill-buffer)
