(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(setq package-archive-priorities
      '(("gnu" . 1)
        ("nongnu" . 1)
        ("melpa" . 2)))

(require 'use-package)

(use-package use-package
  :custom
  (use-package-always-ensure t))

(use-package auto-package-update
  :custom
  (auto-package-update-delete-old-versions t)
  (auto-package-update-interval 14)
  :config
  (auto-package-update-maybe))

(use-package exec-path-from-shell
  :if (eq window-system 'ns)
  :config
  (exec-path-from-shell-copy-env "PATH"))

;;; Inspired by https://github.com/mickeynp/combobulate
(use-package treesit
  :ensure nil
  :preface
  (setq my/ts-grammars-config
        '(((c . ("https://github.com/tree-sitter/tree-sitter-c" "v0.20.7")) . (c-mode . c-ts-mode))
          ((cpp . ("https://github.com/tree-sitter/tree-sitter-cpp" "v0.22.3")) . (c++-mode . c++-ts-mode))))
  (defun my/setup-ts-modes ()
    (dolist (config my/ts-grammars-config)
      (cl-destructuring-bind (grammar . mode-remap) config
        (unless (treesit-language-available-p (car grammar))
          (add-to-list 'treesit-language-source-alist grammar)
          (treesit-install-language-grammar (car grammar)))
        (add-to-list 'major-mode-remap-alist mode-remap))))
  :config
  (my/setup-ts-modes))

(use-package magit
  :bind ("C-c m" . magit-status))

(use-package paredit
  :config
  ;; conflicts with windmove
  (unbind-key "<M-up>" paredit-mode-map)
  (unbind-key "<M-down>" paredit-mode-map)
  ;; conflicts with xref find references
  (unbind-key "M-?" paredit-mode-map)
  :hook
  (emacs-lisp-mode lisp-interaction-mode))

(use-package flycheck)

(use-package lsp-mode
  :custom
  (lsp-enable-snippet nil)
  (lsp-idle-delay 0.5)
  :bind
  (:map lsp-mode-map
        ("C-c l ." . lsp-find-implementation)
        ("C-c l r" . lsp-rename))
  :hook ((c-mode c-ts-mode c++-mode c++-ts-mode) . lsp))

(use-package rustic
  :config
  (push 'rustic-clippy flycheck-checkers)
  :custom
  (rustic-lsp-server 'rust-analyzer))

(use-package lsp-pyright
  :hook (python-mode . lsp))

(use-package company
  :hook
  (after-init . global-company-mode)
  :bind
  (("C-?" . company-complete)
   :map company-active-map
   ("M-<" . company-select-first)
   ("M->" . company-select-last)))

(use-package org
  :ensure nil
  :custom
  (org-agenda-start-on-weekday 0)
  :bind
  (:map org-mode-map
        ("C-c a" . org-agenda))
  (:repeat-map my/org-repeat-map
               ("n" . org-next-visible-heading)
               ("p" . org-previous-visible-heading)
               ("f" . org-forward-heading-same-level)
               ("b" . org-backward-heading-same-level)
               ("^" . org-up-element)
               ("u" . org-up-element)
               ("_" . org-down-element)
               ("d" . org-down-element)
               ("<tab>" . org-cycle)
               ("SPC" . org-shiftright))
  :config
  ;; conflicts with windmove
  (unbind-key "<M-right>" org-mode-map)
  (unbind-key "<M-left>" org-mode-map)
  (unbind-key "<M-down>" org-mode-map)
  (unbind-key "<M-up>" org-mode-map))

(use-package typescript-mode
  :custom
  (typescript-indent-level 2))

(use-package dired
  :ensure nil
  :custom
  (dired-kill-when-opening-new-dired-buffer t))

(use-package emacs-lisp-mode
  :ensure nil
  :bind
  (:map emacs-lisp-mode-map
        ("M-?" . xref-find-references)))

;;; buff-menu mode
(use-package tabulated-list
  :ensure nil
  :config
  ;; conflicts with windmove
  (unbind-key "M-<right>" Buffer-menu-mode-map)
  (unbind-key "M-<left>" Buffer-menu-mode-map))

(use-package multiple-cursors
  :bind ("C-c C-m l" . mc/edit-lines))

(use-package jq-mode)

(use-package mustache-mode)

(use-package multi-line)

(use-package monokai-theme)

(use-package flyspell
  :ensure nil
  :bind (:map flyspell-mode-map
         ;; Unbind keys that conflict with embark
         ("C-," . nil)
         ("C-;" . nil)
         ("C-." . nil))
  :hook
  (text-mode
   (prog-mode . flyspell-prog-mode)))

(use-package yasnippet-snippets)

(use-package yasnippet
  :config
  (yas-reload-all)
  :hook (prog-mode . yas-minor-mode))

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package ag)

(use-package consult
  :bind (([remap switch-to-buffer] . consult-buffer)
         ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
         ([remap goto-line] . consult-goto-line)
         ([remap imenu] . consult-imenu)
         ("C-c c l" . consult-line)
         ("C-c c d" . consult-find)
         ("C-c c r" . consult-grep)
         ("C-c c g" . consult-git-grep)
         ("C-c c m" . consult-mark)))

(use-package git-gutter
  :init
  (global-git-gutter-mode +1)
  :bind
  ("C-x v =" . git-gutter:popup-hunk)
  ("C-x v n" . git-gutter:next-hunk)
  ("C-x v p" . git-gutter:previous-hunk)
  ("C-x v s" . git-gutter:stage-hunk)
  ("C-x v r" . git-gutter:revert-hunk)
  (:repeat-map my/git-gutter-repeat-map
               ("n" . git-gutter:next-hunk)
               ("p" . git-gutter:previous-hunk)
               ("s" . git-gutter:stage-hunk)
               ("r" . git-gutter:revert-hunk)
               :exit
               ("c" . magit-commit))
  :custom
  (git-gutter:ask-p nil))

(use-package gdb-mi
  :ensure nil
  :custom
  (gdb-many-windows t))

(use-package repeat
  :ensure nil
  :init (repeat-mode))

(use-package frame
  :ensure nil
  :bind
  (:repeat-map my/frame-repeat-map
               ("o" . other-frame)
               ("0" . delete-frame)))

(use-package smerge-mode
  :ensure nil
  :bind
  (:repeat-map my/smerge-conflicts-map
               ("n" . smerge-next)
               ("p" . smerge-prev)
               ("u" . smerge-keep-upper)
               ("l" . smerge-keep-lower)))

(use-package embark
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package avy
  :bind ("M-j" . avy-goto-char)
  :config
  (defun avy-action-embark (pt)
    (unwind-protect
        (save-excursion
          (goto-char pt)
          (embark-act))
      (select-window
       (cdr (ring-ref avy-ring 0))))
    t)
  (setf (alist-get ?. avy-dispatch-alist) 'avy-action-embark))

;;; global stuff
(use-package emacs
  :ensure nil
  :bind
  ([remap buffer-menu-other-window] . ibuffer-other-window))
