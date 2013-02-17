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
                      evil
                      projectile
                      nrepl
                      geiser
                      rainbow-delimiters
                      zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Activate evil-mode
(evil-mode 1)

;; Color theme
(load-theme 'zenburn t)

(add-to-list 'load-path "/home/samrat/.emacs.d/non-elpa/powerline")
(require 'powerline)
(powerline-default)

;; Rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'geiser-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'geiser-mode-hook 'paredit-mode)

;; Find file
(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-c f") 'projectile-find-file)

;; Clojurescript is Clojure too!
(add-to-list 'auto-mode-alist '("\\.cljs" . clojure-mode))

;; Mutt support.                                                                                                                                                          
(setq auto-mode-alist
      (append
       '(("/tmp/mutt.*" . mail-mode)
         )
       auto-mode-alist))

(require 'compile)
;; A convenient command to run "lein kibit" in the project to which
;; the current emacs buffer belongs to.
(defun kibit ()
  "Run kibit on the current project.
Display the results in a hyperlinked *compilation* buffer."
  (interactive)
  (compile "lein kibit"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(safe-local-variable-values (quote ((less-css-output-directory . "../stylesheets") (less-css-compile-at-save . t) (whitespace-line-column . 80) (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
