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


(defun my/insert-installed-packages-list ()
  "Inserts quoted list of installed packages by el-get"
  (interactive)
  (insert ?')
  (insert-parentheses)
  (mapcar
   (lambda (package)
     (insert package)
     (insert ?\s))
   (el-get-list-package-names-with-status "installed"))
  ;; delete the last space
  (delete-backward-char 1)
  (forward-char))


(defun my/escape-dbl-quotes ()
  "Escapes double quotes in current region"
  (interactive)
  (save-excursion
    (let ((start (region-beginning))
          (end (1+ (region-end))))
      (goto-char start)
      (while (search-forward "\"" end t)
        (replace-match "\\\"" nil t)))))
