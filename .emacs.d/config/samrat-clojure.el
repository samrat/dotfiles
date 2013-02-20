(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(setq nrepl-popup-stacktraces nil)

(provide 'samrat-clojure)
