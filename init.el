(setq inhibit-startup-message t) ; Get rid of the beginup bloat and menus.
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(set-face-attribute 'default nil :font "Fira Code Nerd Font" :height 110)

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
 ;;(set-frame-parameter (selected-frame) 'alpha <both>)
 ;; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
 ;; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))

(column-number-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook ; Disable line numbers for org-mode or other such modes.
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 0))))

(setq-default tab-width 4)
(setq-default electric-indent-inhibit nil) ; Make electric behave in a normal way. (global-whitespace-mode)
(setq backward-delete-char-untabify-method nil)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4) ; Set C indent to 4.

(electric-pair-mode 1)
(setq show-paren-style 'parenthesis)
(show-paren-mode 0) ; Disabled becaus of Rainbow-delimiters

(ido-mode t)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; (use-package evil
;;   :init 
;;   (setq evil-want-C-u-scroll t) ; Allow scrolling up with ^u.
;;   :config
;;   (evil-mode 0))

(use-package magit)

(use-package org
  :init
    (defun turn-on-org-settings ()
      (setq org-startup-folded t
            org-startup-indented t
            org-pretty-entities t
            org-pretty-entities-include-sub-superscripts t
            org-use-sub-superscripts "{}"))


  :hook
    (org-mode . visual-line-mode))

;; Variable-pitch
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 180)

;; Fixed-pitch
(set-face-attribute 'fixed-pitch nil :font "Fira Code Nerd Font" :height 100)

;; (require 'org-indent) 
(with-eval-after-load 'org-faces
    (dolist (face '((org-level-1 . 1.2)
                    (org-level-2 . 1.15)
                    (org-level-3 . 1.1)
                    (org-level-4 . 1.0)
                    (org-level-5 . 1.1)
                    (org-level-6 . 1.1)
                    (org-level-7 . 1.1)
                    (org-level-8 . 1.1)))
      (set-face-attribute (car face) nil :height (cdr face)))
      (turn-on-org-settings)) ; Necessary to apply all preferences.

    ;; (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
    ;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
    ;; (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
    ;; (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    ;; (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    ;; (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

; (setq org-confirm-babel-evaluate nil)

(use-package org-superstar
  ; :config (setq org-superstar-headline-bullets-list '("⬢" "◆" "▲" "■"))
  :hook (org-mode . org-superstar-mode))

(use-package company
  :config
    (setq company-idle-delay 0) ; Tell company-mode to be immediate.
    (setq company-minimum-prefix-length 1)
  :hook (prog-mode . company-mode))

(use-package doom-themes
  :config
    (setq doom-themes-enable-bold t)
    (setq doom-themes-enable-italic t)
    (load-theme 'doom-one t)) ; Might switch between "one" and "gruvbox", both are pretty good.

(use-package doom-modeline
  :config
    (setq doom-modeline-height 40)
    ; (doom-modeline-mode 1)
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package lsp-mode
  :init
    (setq lsp-keymap-prefix "C-c l")
  :config
    (setq lsp-idle-delay 0.500)
    (setq lsp-enable-snippet nil))
  ;:hook
    ;; (c-mode . lsp)
    ;; (cpp-mode . lsp)
    ;; (lsp-mode . lsp-enable-which-key-integration))

(use-package treemacs)

(use-package pdf-tools
  :config
  (pdf-tools-install))
