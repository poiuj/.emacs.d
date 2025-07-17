(dolist (file '(
                "packages.el"
                "utils.el"
                "global-keys.el"
                "etc.el"
                "style.el"
                "security.el"
                ))
  (load-file (expand-file-name file user-emacs-directory)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
