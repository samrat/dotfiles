(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      nrepl
                      geiser
                      rainbow-delimiters
                      auto-complete
                      ac-nrepl
                      zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Color theme
(load-theme 'zenburn t)
(add-to-list 'load-path "/home/samrat/.emacs.d/config")
(add-to-list 'load-path "/home/samrat/.emacs.d/vendor/powerline")

(require 'samrat-mail)
(require 'samrat-erc)
(require 'samrat-org)
(require 'samrat-clojure)

(require 'server)
(unless (server-running-p)
  (server-start))

(require 'powerline)
(powerline-default)

;; Rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'geiser-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'geiser-mode-hook 'paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(org-agenda-files (quote ("~/org/media.org" "~/org/nlangp.org" "~/Dropbox/org/projects.org" "~/Dropbox/org/home.org")))
 '(safe-local-variable-values (quote ((less-css-output-directory . "../stylesheets") (less-css-compile-at-save . t) (whitespace-line-column . 80) (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
