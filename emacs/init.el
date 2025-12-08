(setq visible-bell t)
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(load-theme 'modus-vivendi t)
(add-to-list 'default-frame-alist
	     '(font . "Iosevka-14"))
(which-key-mode t)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; (setq set-mark-command-repeat-pop t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(use-package vertico
  :ensure t
  ;; :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))
(use-package surround
  :ensure t
  :bind-keymap ("M-'" . surround-keymap))
(use-package magit
  :ensure t)
