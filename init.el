;;; ensure el-get is installed

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.emacs.d/el-get/el-get-init")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq my:el-get-packages
      '(cl-lib 
        el-get
        gotham-theme
        highlight-parentheses
        init-paredit
        paredit
        slime
        sticky-windows))

(el-get 'sync my:el-get-packages)

(el-get 'sync)

(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/global-keys.el")
(load-file "~/.emacs.d/etc.el")
(load-file "~/.emacs.d/init-predefined.el")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
