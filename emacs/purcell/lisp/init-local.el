;; init-local --- personal configs
;; Personal Configs

(require 'use-package)

(eval-when-compile
  (require 'use-package))

;; Packages
(use-package treemacs
  :ensure
  :bind ([f8] . treemacs))

(use-package treemacs-evil
  :ensure
  :after (treemacs evil))

(use-package treemacs-projectile
  :ensure
  :after (treemacs projectile))

(use-package wttrin
  :ensure t
  :bind ([f9] . wttrin))

(use-package all-the-icons
  :ensure t)

(use-package yaml-mode
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
  :hook ((go-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration)
         (js2-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (ruby-mode . lsp-deferred))
  :commands (lsp lsp-deferred))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-c SPC" . ace-jump-mode))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(use-package kaolin-themes
  :ensure
  :config
  (kaolin-treemacs-theme))

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
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-enable-word-count t))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  ;; Evil/Vim keybindings
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-collection-init)
  ;; Golang specific keybinding
  (evil-define-key 'normal go-mode-map
    (kbd "gD") 'godef-jump-other-window)
  ;; Global Keybinding
  (evil-global-set-key 'normal "s" 'avy-goto-char-2)
  (evil-global-set-key 'normal "S" 'avy-goto-char-2)
  (evil-ex-define-cmd "bd[elete]" 'kill-buffer)
  (evil-global-set-key 'normal (kbd "C-u") 'evil-scroll-up)
  (evil-global-set-key 'normal (kbd "<leader>k") 'counsel-ag)
  (evil-global-set-key 'normal (kbd "<leader>d") 'dired)
  (evil-global-set-key 'normal (kbd "<leader>.") 'find-file-at-point)
  (evil-global-set-key 'normal (kbd "<leader>f") 'find-file)
  (evil-global-set-key 'normal (kbd "<leader>b") 'switch-to-buffer)
  (evil-global-set-key 'normal (kbd "<leader>/") 'counsel-projectile-find-file)
  (evil-global-set-key 'normal (kbd "<leader>p") 'projectile-command-map)
  (evil-global-set-key 'normal (kbd "<leader>w") 'evil-window-map)
  (evil-global-set-key 'normal (kbd "<leader>B") 'switch-to-buffer-other-window)
  (evil-global-set-key 'normal (kbd "<leader>g") 'magit-status)
  (evil-global-set-key 'normal (kbd "C-e") 'end-of-line)
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map [escape] 'evil-normal-state))


(use-package evil-surround
  :after evil
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-nerd-commenter
  :after evil
  :ensure t
  :config
  (evilnc-default-hotkeys nil t)
  (evil-global-set-key 'normal "gc" 'evilnc-comment-or-uncomment-lines))

(use-package evil-snipe
  :after evil
  :ensure t
  :config
  (evil-snipe-override-mode 1))

(use-package vimish-fold
  :ensure
  :after evil)

(use-package evil-vimish-fold
  :after vimish-fold
  :ensure
  :hook ((prog-mode conf-mode text-mode) . evil-vimish-fold-mode))

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
  (setq org-fancy-priorities-list '("‚ö°" "‚¨Ü" "‚¨á" "‚òï")))

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
          (counsel-M-x     . ivy-posframe-display-at-window-center)
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

(use-package counsel
  :ensure t
  :after ivy
  :init
  (counsel-mode)
  :bind
  ("C-c k" . 'counsel-ag))

(use-package counsel-projectile
  :ensure t
  :after (counsel)
  :init
  (counsel-projectile-mode)
  :bind
  ("C-c p" . projectile-mode-map))

(use-package dockerfile-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;; test
(use-package docker-compose-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :mode
  (("\\.phtml\\'" . web-mode)
   ("\\.tpl\\.php\\'" . web-mode)
   ("\\.jsp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ("\\.jst.ejs\\'" . web-mode)
   ("\\.html?\\'" . web-mode))
  :config
  (setq web-mode-engines-alist
        '(("django" . "focus/.*\\.html\\'")
          ("ctemplate" . "realtimecrm/.*\\.html\\'"))))


(use-package js2-refactor
  :ensure t
  :init   (add-hook 'js2-mode-hook 'js2-refactor-mode)
  :config (js2r-add-keybindings-with-prefix "C-c ."))

(use-package skewer-mode
  :ensure t
  :init (add-hook 'js2-mode-hook 'skewer-mode))

(use-package emmet-mode
  :ensure t
  :after web-mode
  :hook (web-mode . emmet-mode))

(use-package web-beautify
  :ensure t)

(use-package rainbow-mode
  :ensure t
  :hook (scss-mode less-mode css-mode))

(use-package graphql-mode
  :ensure t
  :mode
  ("\\.graphqls\\'" . graphql-mode))

(use-package go-add-tags
  :ensure t)

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
(load-theme 'kaolin-galaxy)

;; (set-frame-font "JetBrains Mono Medium 11" nil t)
(set-face-attribute 'default nil :font "JetBrains Mono Medium" :height 110)

;; Keybindings
(setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?c ?v ?b ?n ?m ?r ?t ?u ?i ?o))
(global-set-key (kbd "C-;") 'avy-goto-char-2)
(global-set-key (kbd "C-x .") 'find-file-at-point)
(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-c /") 'counsel-projectile-find-file)
;; Font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq wttrin-default-cities '("Florianopolis" "Sao Paulo" "Ribeirao Preto"))

(setq rspec-use-rvm t)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

(global-hl-todo-mode)

(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))))

(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)

(setq display-fill-column-indicator nil)
(setq display-fill-column-indicator-column nil)

(define-key global-map (kbd "RET") 'newline)

(with-eval-after-load 'go-mode
  (define-key go-mode-map (kbd "C-c t") #'go-add-tags))

(provide 'init-local)
