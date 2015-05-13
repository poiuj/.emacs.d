(require 'org)

(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "M-<up>") nil)
     (define-key org-mode-map (kbd "M-<down>") nil)
     (define-key org-mode-map (kbd "M-<left>") nil)
     (define-key org-mode-map (kbd "M-<right>") nil)

     (define-key org-mode-map (kbd "C-*") 'org-metaright)
     (define-key org-mode-map (kbd "M-*") 'org-metaleft)))
