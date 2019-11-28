;;; .doom.d/config.el -*- lexical-binding: t; -*-

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Shortcuts or global keys
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'wttrin)
(setq doom-localleader-key ",")

;; Enable autopep8 and modes for Python
(require 'py-autopep8)
(elpy-enable)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Theme
(setq doom-theme 'hc-zenburn)

;; Personal Configurations
(setq display-line-numbers-type 'relative)
(setq wttrin-default-cities '("Florianópolis" "São Paulo" "Ribeirão Preto"))
