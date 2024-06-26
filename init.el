(if (string-equal "darwin" (symbol-name system-type))
    (setenv "PATH" (concat "~/.cargo/bin:" (getenv "PATH"))))
(setq exec-path (split-string (getenv "PATH") ":"))

(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/global-keys.el")
(load-file "~/.emacs.d/etc.el")
(load-file "~/.emacs.d/style.el")
(load-file "~/.emacs.d/security.el")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
