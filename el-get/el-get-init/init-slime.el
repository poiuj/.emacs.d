;;; init for slime

(require 'slime)
(setq inferior-lisp-program "/bin/sbcl")
(slime-setup '(slime-fancy))
