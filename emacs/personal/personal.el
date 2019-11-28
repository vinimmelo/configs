;; Personal Emac's configuration - By Vinicius Melo

;; Packages to be installed
(prelude-require-packages '(dashboard
                            page-break-lines
                            neotree
                            doom-themes
                            powerline
                            editorconfig
                            all-the-icons
                            linum-relative
                            org-super-agenda))

;; Personal Configurations
(setq user-full-name "Vinicius Melo")
(setq user-mail-address "vinimmelo.dev@gmail.com")

;; Required packages
(require 'dashboard)
(require 'neotree)
(require 'all-the-icons)
(require 'powerline)
(require 'linum-relative)
(require 'org-super-agenda)

;; Other Configurations
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "/home/vinimmelo/Downloads/emacsV1.iconset/emacsV2.iconset/256x256.png")
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))
(show-paren-mode t)

(setq-default highlight-tabs t)
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))


;; Specific at the startup
(toggle-frame-maximized)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'all-the-icons)
;; (disable-theme 'zenburn)
;; (load-theme 'doom-molokai)
(powerline-default-theme)
;;(linum-relative-global-mode)
(add-hook 'prog-mode-hook (lambda () (setq display-line-numbers 'relative)))
(set-face-attribute 'whitespace-line nil
                    :foreground nil
                    :background nil)
