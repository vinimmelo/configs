;;; .doom.d/config.el -*- lexical-binding: t; -*-

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Shortcuts or global keys
(map! [f8] #'neotree-toggle)
(map! [f9] #'wttrin)
(setq doom-localleader-key ",")
(map! "C-s" #'swiper-isearch)

;; Python config
;; (setq elpy-rpc-python-command "python")
;; (elpy-enable)

;; Org Config
(setq org-log-done 'time)

;; Theme
;; (setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-zenburn)
;; (setq doom-theme 'sunburn)
;; (setq doom-theme 'doom-old-hope)
;; (setq doom-theme 'doom-oceanic-next)
;; (setq doom-theme 'kaolin-valley-dark)
;; (setq doom-theme 'doom-monokai-classic)
(setq doom-theme 'doom-molokai)

(require 'powerline)
(show-paren-mode t)
(setq show-paren-style 'expression)

;; Personal Configurations
(setq display-line-numbers-type 'relative)
(setq wttrin-default-cities '("Florianópolis" "São Paulo" "Ribeirão Preto"))

;; Avy specifics
(map! [f5] #'avy-goto-char-2)
(map! "C-c ;" #'avy-goto-char-2)
(map! "C-c ." #'avy-goto-char)

;; Set Font
;; (setq doom-font (font-spec :family "Hack" :size 16))
; (setq doom-font (font-spec :family "JetBrains Mono" :size 14))
(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'normal))

(custom-set-variables
 '(org-directory "~/Documents")
 '(org-agenda-files (list org-directory)))

(setq org-default-notes-file (concat org-directory "~/Documents/work.org"))

(map! "C-j" #'emmet-expand-line)

;; Set neotree theme
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Change ibuffer behavior
(map! :g "C-x C-b" 'ibuffer)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 3)

;; You can specify one if you encounter the issue.
(setq doom-modeline-project-detection 'project)
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'truncate-with-project)

;; Whether display icons in mode-line. Respects `all-the-icons-color-icons'.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon (display-graphic-p))

;; Whether display the icon for `major-mode'. Respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon nil)

;; Whether display the colorful icon for `major-mode'.
;; Respects `doom-modeline-major-mode-icon'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; Respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback nil)

;; Whether display the minor modes in mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count t)

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding nil)

;; Whether display the indentation information.
(setq doom-modeline-indent-info nil)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format nil)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 20)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 10)

;; Whether display the perspective name. Non-nil to display in mode-line.
(setq doom-modeline-persp-name nil)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name nil)

;; Whether display the `lsp' state. Non-nil to display in mode-line.
(setq doom-modeline-lsp t)
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
(setq doom-modeline-mu4e nil)

;; Whether display the gnus notifications.
(setq doom-modeline-gnus nil)

;; Wheter gnus should automatically be updated and how often (set to nil to disable)
(setq doom-modeline-gnus-timer 2)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the environment version.
(setq doom-modeline-env-version nil)
;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python3") ; or `python-shell-interpreter'
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")

;; Hooks
(after! doom-themes
  (remove-hook 'doom-load-theme-hook #'doom-themes-neotree-config))

;; Always use dired
(map! "C-x C-d" #'dired)
(map! "C-x d" #'dired)


;; Hydras

(global-set-key
 (kbd "C-ç")
 (defhydra hydra-avy (:exit t :hint nil)
  "
 Line^^       Region^^        Goto
----------------------------------------------------------
 [_y_] yank   [_Y_] yank      [_c_] char 2      [_C_] char
 [_m_] move   [_M_] move      [_w_] word        [_W_] any word
 [_k_] kill   [_K_] kill      [_l_] line        [_L_] end of line"
  ("c" avy-goto-char-2)
  ("C" avy-goto-char)
  ("w" avy-goto-word-1)
  ("W" avy-goto-word-0)
  ("l" avy-goto-line)
  ("L" avy-goto-end-of-line)
  ("m" avy-move-line)
  ("M" avy-move-region)
  ("k" avy-kill-whole-line)
  ("K" avy-kill-region)
  ("y" avy-copy-line)
  ("Y" avy-copy-region))
)


(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))


(global-set-key
 (kbd "M-p")
(defhydra hydra-projectile (:color teal
                            :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("s-f" projectile-find-file)
  ("ff"  projectile-find-file-dwim)
  ("fd"  projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("s-p" projectile-switch-project "switch project")
  ("p"   projectile-switch-project)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))
)

(defhydra hydra-buffer-menu (:color pink
                             :hint nil)
  "
^Mark^             ^Unmark^           ^Actions^          ^Search
^^^^^^^^-----------------------------------------------------------------
_m_: mark          _u_: unmark        _x_: execute       _R_: re-isearch
_s_: save          _U_: unmark up     _b_: bury          _I_: isearch
_d_: delete        ^ ^                _g_: refresh       _O_: multi-occur
_D_: delete up     ^ ^                _T_: files only: % -28`Buffer-menu-files-only
_~_: modified
"
  ("m" Buffer-menu-mark)
  ("u" Buffer-menu-unmark)
  ("U" Buffer-menu-backup-unmark)
  ("d" Buffer-menu-delete)
  ("D" Buffer-menu-delete-backwards)
  ("s" Buffer-menu-save)
  ("~" Buffer-menu-not-modified)
  ("x" Buffer-menu-execute)
  ("b" Buffer-menu-bury)
  ("g" revert-buffer)
  ("T" Buffer-menu-toggle-files-only)
  ("O" Buffer-menu-multi-occur :color blue)
  ("I" Buffer-menu-isearch-buffers :color blue)
  ("R" Buffer-menu-isearch-buffers-regexp :color blue)
  ("c" nil "cancel")
  ("v" Buffer-menu-select "select" :color blue)
  ("o" Buffer-menu-other-window "other-window" :color blue)
  ("q" quit-window "quit" :color blue))

(define-key Buffer-menu-mode-map "." 'hydra-buffer-menu/body)

;; Lsp Performance Improvement
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-ui-doc-enable nil)

;; Company
(setq company-lsp-async t)
(setq company-lsp-enable-snippet t)
(setq company-lsp-cache-candidates 'auto)

(setq company-tooltip-align-annotations t)

;; Angular Specifics
(setq lsp-clients-angular-language-server-command
  '("node"
    "/usr/lib/node_modules/@angular/language-server"
    "--ngProbeLocations"
    "/usr/lib/node_modules"
    "--tsProbeLocations"
    "/usr/lib/node_modules"
    "--stdio"))

;; Typescript Tide mode
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; Magit gravatars
(setq magit-revision-show-gravatars '("^Author:     " . "^Commit:     "))

;; Doom typescript magic
(after! dtrt-indent
  (add-to-list 'dtrt-indent-hook-mapping-list '(typescript-mode javascript typescript-indent-level)))
(require 'keychain-environment)
(keychain-refresh-environment)
(exec-path-from-shell-initialize)
(sp-local-pair 'emacs-lisp-mode "{" nil :post-handlers '(:add my-add-space-after-sexp-˓→insertion))
(sp-local-pair 'emacs-lisp-mode "(" nil :post-handlers '(:add my-add-space-after-sexp-˓→insertion))
(sp-local-pair 'emacs-lisp-mode "[" nil :post-handlers '(:add my-add-space-after-sexp-˓→insertion))

(defun my-add-space-after-sexp-insertion (id action _context)
  (when (eq action 'insert)
    (save-excursion
      (forward-char (length (plist-get (sp-get-pair id) :close)))
      (when (or(eq (char-syntax (following-char)) ?w)
               (looking-at (sp--get-opening-regexp)))
        (insert " ")))))

(all-the-icons-ivy-setup)
(all-the-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)
(setq org-startup-with-inline-images 1)
(setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file
        counsel-projectile-find-dir projectile-find-file))

;; Rvm use default
(setq ruby-version-manager 'rvm)
(rvm-use-default)

(setq lsp-enable-file-watchers nil)
