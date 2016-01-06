(require 'flex-mode)

;;; set flex-mode when .flex file is opened
(add-to-list 'auto-mode-alist '("\\.flex\\'" . flex-mode))

;;; turn off paredit-mode
(when (require 'paredit-mode nil t)
  (add-hook 'flex-mode-hook
            (lambda () (paredit-mode nil))))
