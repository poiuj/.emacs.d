;;; init for slime

(require 'slime)
(setq inferior-lisp-program "/bin/sbcl")
(slime-setup '(slime-fancy))

(global-set-key (kbd "C-h C-y") 'slime-hyperspec-lookup)
(global-set-key (kbd "C-M-e") 'slime-inspect)

(add-hook 'slime-repl-mode-hook (lambda () (linum-mode -1)))

;;; use paredit in slime repl if available

(when (require 'paredit "paredit" t)
  (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1))))
