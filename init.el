(setq inhibit-startup-message t) ; Get rid of the startup bloat and menus.
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
; (load-theme 'gruvbox t)
(tooltip-mode -1)
(set-fringe-mode 10)

; (add-hook 'prog-mode-hook (lambda () (setq-default tab-width 8)))

(set-face-attribute 'default nil :font "Fira Code" :height 100) ; Setting Fira Code as font.

(windmove-default-keybindings)

(column-number-mode)
(global-display-line-numbers-mode t)

;; (setq display-line-numbers-type 'relative)

(dolist (mode '(org-mode-hook ; Disble line numbers for org-mode or other such modes.
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 0))))

(setq company-idle-delay 0) ; Tell company-mode to be immediate.
(global-company-mode t) ; Set company mode to be global.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" default))
 '(package-selected-packages
   '(fira-code-mode which-key doom-themes rainbow-delimiters doom-modeline zenburn-theme use-package highlight-indent-guides company)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (load-theme 'doom-one t)) ; Might switch between "one" and "gruvbox", both are pretty good.

(use-package doom-modeline
  :ensure t
  :config
  :init (doom-modeline-mode 1))

(use-package all-the-icons)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package fira-code-mode
  :custom (fira-code-mode-disabled-ligatures '("[]" "x"))  ; ligatures you don't want
  :hook prog-mode)                                         ; mode to enable fira-code-mode in
