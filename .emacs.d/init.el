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
                      magit
                      rainbow-delimiters
                      auto-complete
                      ac-nrepl
                      ag
                      zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Color theme
(load-theme 'zenburn t)
(add-to-list 'load-path "/home/samrat/.emacs.d/config")
(add-to-list 'load-path "/home/samrat/.emacs.d/vendor")

(require 'samrat-mail)
(require 'samrat-erc)
(require 'samrat-org)
(require 'samrat-clojure)

(require 'server)
(unless (server-running-p)
  (server-start))

(require 'ag)
(global-set-key (kbd "<f5>") 'ag-project-at-point)
(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)

(eval-after-load 'whitespace
  '(diminish 'whitespace-mode))
(eval-after-load 'paredit
  '(diminish 'paredit-mode))
(eval-after-load 'eldoc
  '(diminish 'eldoc-mode))
(eval-after-load 'diminish ; need to delay till after packages are all loaded
  '(diminish 'auto-fill-function))

;; Show autocompletions only on TAB
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

(setq scheme-program-name "racket")

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
 '(custom-safe-themes (quote ("d24e10524bb50385f7631400950ba488fa45560afcadd21e6e03c2f5d0fad194" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "fe6330ecf168de137bb5eddbf9faae1ec123787b5489c14fa5fa627de1d9f82b" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(org-agenda-files (quote ("~/Dropbox/notes")))
 '(safe-local-variable-values (quote ((less-css-output-directory . "../stylesheets") (less-css-compile-at-save . t) (whitespace-line-column . 80) (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
