;;; various options

;;; frame appearance
(when (window-system)
  (tool-bar-mode -1)
  (setq initial-frame-alist '((fullscreen . maximized))))

(setq inhibit-startup-screen +1)

;;; scroll
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      mouse-wheel-follow-mouse 't
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;;; indent
(setq-default indent-tabs-mode nil)
(setq show-trailing-whitespace t)

;;; backup
(setq make-backup-files nil)

;;; other minor modes
(global-hl-line-mode +1)
(global-linum-mode +1)
(global-prettify-symbols-mode +1)
(setq uniquify-buffer-name-style 'forward)
(cua-mode +1)
