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

;; Go Specifics language
(add-to-list 'exec-path "/user/local/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)
(defun auto-complete-for-go ()
(auto-complete-mode 1))
 (add-hook 'go-mode-hook 'auto-complete-for-go)

;; Copy Entire Line
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
(global-set-key "\C-c\C-k" 'copy-line)
