(defun my/clean-and-indent-buffer ()
  "Clean and indent current buffer"
  (interactive)
  (indent-region (point-min) (point-max))
  (whitespace-cleanup))


(defun my/pp-json ()
  "Pretty print whole buffer or current region"
  (interactive)
  (if (mark)
      (json-pretty-print (region-beginning) (region-end))
      (json-pretty-print (point-min) (point-max))))
