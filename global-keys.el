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

(global-set-key (kbd "C-x 0") 'sticky-window-delete-window)
(global-set-key (kbd "C-x 1") 'sticky-window-delete-other-windows)
(global-set-key (kbd "C-x 9") 'sticky-window-keep-window-visible)

(global-set-key (kbd "C-c n") 'my/clean-and-indent-buffer)

(global-set-key (kbd "C-^") 'enlarge-window)
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)

(global-set-key (kbd "C-x p") 'my/pp-json)
