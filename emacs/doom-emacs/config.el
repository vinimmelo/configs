;;; .doom.d/config.el -*- lexical-binding: t; -*-

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Shortcuts or global keys
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'wttrin)
(setq doom-localleader-key ",")

;; Python config
(elpy-enable)

;; Org Config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-log-done 'time)

;; Theme
(setq doom-theme 'doom-molokai)

;; Moe Theme
;; (show-paren-mode t)
;; (setq show-paren-style 'expression)
;; (require 'moe-theme)
;; (setq moe-theme-highlight-buffer-id t)
;; (moe-theme-set-color 'orange)
;; (moe-light)

;; Personal Configurations
(setq display-line-numbers-type 'relative)
(setq wttrin-default-cities '("Florianópolis" "São Paulo" "Ribeirão Preto"))
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key [f5] 'avy-goto-char-2)
