;;; init for global keys

(global-set-key (kbd "C-<down>") 'scroll-up-line)
(global-set-key (kbd "C-<up>") 'scroll-down-line)

(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)

(global-set-key (kbd "C-`") 'other-window)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(global-set-key (kbd "C-M-%") 'query-replace)
(global-set-key (kbd "M-%") 'query-replace-regexp)

(global-set-key (kbd "C-x 0") 'sticky-window-delete-window)
(global-set-key (kbd "C-x 1") 'sticky-window-delete-other-windows)
(global-set-key (kbd "C-x 9") 'sticky-window-keep-window-visible)

(global-set-key (kbd "C-c n") 'my/clean-and-indent-buffer)
(global-set-key (kbd "C-c q") 'my/escape-dbl-quotes)

(global-set-key (kbd "C-^") 'enlarge-window)
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)

(global-set-key (kbd "C-x p") 'my/pp-json)

(global-set-key (kbd "s-w") 'backward-kill-sexp)

(global-set-key (kbd "C-c m") 'magit-status)

(global-set-key (kbd "C-c u") 'browse-url)

(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-x M-w") 'my/save-file-path)

;;; MAC OS X specific
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'control)
  (setq mac-option-modifier 'meta)
  (setq mac-control-modifier 'super))
