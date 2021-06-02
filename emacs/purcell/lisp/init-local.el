;; init-local --- personal configs
;; Personal Configs

(eval-when-compile 
  (require 'use-package))

;; Packages
(use-package neotree
  :ensure t
  :bind ([f8] . neotree-toggle))

(use-package wttrin
 :ensure t
 :bind ([f9] . wttrin))

(use-package all-the-icons
 :ensure t)

(use-package go-mode
 :ensure t)

(use-package ace-jump-mode
 :ensure t
 :bind ("C-c SPC" . ace-jump-mode))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(use-package sml-mode
 :ensure t
 :init
 (add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode)))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-lsp t)
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project))

(use-package polymode
  :ensure t)

(use-package poly-ruby
  :ensure t
  :after (polymode)
  :bind ("C-c m" . toggle-poly-ruby-mode))

(use-package poly-markdown
  :ensure t
  :after (polymode))

(use-package rvm
  :ensure t)

(use-package org-superstar
  :ensure t
  :init (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(use-package company-go
  :ensure t
  :after (company))

(use-package prescient
  :ensure t)

(use-package company-prescient
  :ensure t
  :after (prescient))

;; Personal Config
(load-theme 'doom-old-hope)
(set-frame-font "JetBrains Mono Bold 12" nil t)

;; Keybindings
(global-set-key (kbd "C-;") 'avy-goto-char-2)
(global-set-key (kbd "C-x .") 'find-file-at-point)
(global-set-key (kbd "C-x C-d") 'dired)
;; Font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq display-fill-column-indicator nil)

(setq wttrin-default-cities '("Florianopolis" "Sao Paulo" "Ribeirao Preto"))

(setq rspec-use-rvm t)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/todo.org" "Tasks")
         "* TODO %t %?\n ")
        ("n" "Note" entry (file+headline "~/Documents/notes.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

(provide 'init-local)
