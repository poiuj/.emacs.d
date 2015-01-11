;;; my extra pardit settings
(require 'paredit)

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "C-<left>") nil)
     (define-key paredit-mode-map (kbd "C-<right>") nil)
     (define-key paredit-mode-map (kbd "M-w") 'paredit-wrap-sexp)
     (define-key paredit-mode-map (kbd "C-(") 'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "C-)") 'paredit-forward-slurp-sexp)))

