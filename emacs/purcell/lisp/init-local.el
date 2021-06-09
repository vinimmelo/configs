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
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook (lambda () (setq tab-width 4))))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (go-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

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

(use-package prescient
  :ensure t)

(use-package company-prescient
  :ensure t
  :after (prescient))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet))

(use-package go-snippets
  :ensure t
  :after (yasnippet))

(use-package django-snippets
  :ensure t
  :after (yasnippet))

(use-package counsel
  :ensure t
  :after ivy
  :bind
  ("C-c k" . 'counsel-ag))


(use-package swiper
  :ensure t
  :after (ivy)
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package ivy-posframe
  :ensure t
  :after (ivy)
  :config
  (setq ivy-posframe-display-functions-alist
        '((swiper          . ivy-posframe-display-at-window-center)
          (complete-symbol . ivy-posframe-display-at-point)
          (counsel-M-x     . ivy-posframe-display-at-frame-bottom-left)
          (t               . ivy-posframe-display)))
  (ivy-posframe-mode 1))

(use-package ivy-avy
  :ensure t
  :after (ivy))

(use-package go-projectile
  :ensure t)

(use-package smex
  :ensure t
  :after (ivy))

(use-package counsel-projectile
  :ensure t
  :after (counsel)
  :init
  (counsel-projectile-mode)
  :bind
  ("C-c p" . projectile-mode-map))

(use-package ivy
  :ensure t
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode)
  (setq enable-recursive-minibuffers t)
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) ""))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :ensure t
  :after (ivy)
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-rich-mode 1))


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

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'init-local)
