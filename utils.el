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

(defun my/save-file-path (arg)
  "Copy the current file path to kill ring, and save in the clipboard"
  (interactive "P")
  (let* ((full-file-path (if (equal major-mode 'dired-mode)
                             default-directory
                           (buffer-file-name)))
         (filepath (if arg
                       (file-name-nondirectory full-file-path)
                     full-file-path)))
    (when filepath
      (with-temp-buffer
        (insert filepath)
        (clipboard-kill-ring-save (point-min) (point-max)))
      (message filepath))))

(defun my/start-org-mode ()
  "Sets major mode to org-mode and inserts mode line"
  (interactive)
  (org-mode)
  (insert "-*- mode: org -*-
"))

(defun my/upcase-last-sexp ()
  "Upcases last sexp"
  (interactive)
  (save-excursion
    (let ((end (point)))
      (backward-sexp)
      (upcase-region (point) end))))
