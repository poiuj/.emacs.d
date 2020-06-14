;;; ensure el-get is installed

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-user-package-directory "~/.emacs.d/el-get/el-get-init")

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq my:el-get-packages
      '(cl-lib csharp-mode dash el-get emacs-async exec-path-from-shell gradle-mode haskell-mode highlight-parentheses magit matlab-mode paredit s slime sticky-windows with-editor))

(el-get 'sync my:el-get-packages)

(el-get 'sync)

(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/global-keys.el")
(load-file "~/.emacs.d/etc.el")
(load-file "~/.emacs.d/init-predefined.el")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
