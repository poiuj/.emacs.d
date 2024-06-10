;;; init for global keys

(keymap-global-set "C-<down>" 'scroll-up-line)
(keymap-global-set "C-<up>" 'scroll-down-line)

(keymap-global-set "C-<left>" 'left-word)
(keymap-global-set "C-<right>" 'right-word)

(keymap-global-set "C-`" 'other-window)
(keymap-global-set "M-<up>" 'windmove-up)
(keymap-global-set "M-<down>" 'windmove-down)
(keymap-global-set "M-<left>" 'windmove-left)
(keymap-global-set "M-<right>" 'windmove-right)

(keymap-global-set "C-s" 'isearch-forward-regexp)
(keymap-global-set "C-r" 'isearch-backward-regexp)

(keymap-global-set "C-M-%" 'query-replace)
(keymap-global-set "M-%" 'query-replace-regexp)

(keymap-global-set "C-c n" 'my/clean-and-indent-buffer)
(keymap-global-set "C-c q" 'my/escape-dbl-quotes)

(keymap-global-set "C-^" 'enlarge-window)
(keymap-global-set "C-}" 'enlarge-window-horizontally)

(keymap-global-set "C-c p" 'my/pp-json)

(keymap-global-set "s-w" 'backward-kill-sexp)

(keymap-global-set "C-c u" 'browse-url)

(keymap-global-set "M-z" 'zap-up-to-char)

(keymap-global-set "C-x M-w" 'my/save-file-path)

(keymap-global-set "C-x M-u" 'my/upcase-last-sexp)

(keymap-global-set "C-c s l" 'sort-lines)

(keymap-global-set "C-x C-b" 'buffer-menu-other-window)

;;; MAC OS X specific
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'control)
  (setq mac-option-modifier 'meta)
  (setq mac-control-modifier 'super))
