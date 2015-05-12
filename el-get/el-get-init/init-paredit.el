;;; my extra pardit settings
(require 'paredit)

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "C-<left>") nil)
     (define-key paredit-mode-map (kbd "C-<right>") nil)
     (define-key paredit-mode-map (kbd "M-<up>") nil)
     (define-key paredit-mode-map (kbd "M-<down>") nil)

     (define-key paredit-mode-map (kbd "M-w") 'paredit-wrap-sexp)
     (define-key paredit-mode-map (kbd "C-(") 'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "C-)") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "DEL") 'paredit-backward-delete)))

