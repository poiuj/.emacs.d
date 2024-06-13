;;; various options

;;; frame appearance
(when (window-system)
  (tool-bar-mode -1)
  (setq initial-frame-alist '((fullscreen . maximized))))
(menu-bar-mode -1)

(setq inhibit-startup-screen +1)

(load-theme 'monokai t)
(add-hook 'window-size-change-functions #'my/adjust-font-size)

;;; scroll
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      mouse-wheel-follow-mouse 't
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;;; backup
(setq make-backup-files nil)

;; autosave
(setq auto-save-default nil)

;;; allow narrow-to-region
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; other minor modes
(global-hl-line-mode +1)
(global-display-line-numbers-mode)
(column-number-mode +1)
(setq uniquify-buffer-name-style 'forward)
(show-paren-mode +1)

;; indent java
(add-hook 'java-mode-hook (lambda () (c-set-offset 'arglist-intro '++)))

;; do not add coding line in ruby files
(setq ruby-insert-encoding-magic-comment nil)

;; use ruby-end mode
(add-hook 'ruby-mode-hook (lambda () (ruby-end-mode 1)))
