(defun my/clean-and-indent-buffer ()
  "Clean and indent current buffer"
  (interactive)
  (indent-region (point-min) (point-max))
  (whitespace-cleanup))
