;;; init for slime

(require 'slime)
(setq inferior-lisp-program "/bin/sbcl")
(slime-setup '(slime-fancy))

(global-set-key (kbd "C-h C-y") 'slime-hyperspec-lookup)
