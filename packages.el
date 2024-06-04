(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(setq package-archive-priorities
      '(("gnu" . 1)
        ("nongnu" . 1)
        ("melpa" . 2)))

(require 'use-package)

(use-package use-package-ensure
  :custom
  (use-package-always-ensure t))

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package magit
  :bind ("C-c m" . 'magit-status))

(use-package paredit
  :config
  (dolist (hook '(emacs-lisp-mode-hook
                  lisp-interaction-mode-hook))
    (add-hook hook #'paredit-mode))
  (unbind-key "<M-up>" paredit-mode-map)
  (unbind-key "<M-down>" paredit-mode-map)
  (unbind-key "M-?" paredit-mode-map))

(use-package rustic
  :config
  (remove-hook 'rustic-mode-hook 'flycheck-mode)
  :custom
  (rustic-lsp-server 'rust-analyzer))

(use-package lsp-mode
  :custom
  (lsp-enable-snippet nil)
  (lsp-idle-delay 0.5)
  ;; rust
  (lsp-rust-server 'rust-analyzer)
  :bind
  (:map lsp-mode-map
        ("C-c C-c ." . lsp-find-implementation)
        ("C-c C-c r" . lsp-rename))
  :hook (c-mode . lsp))

(use-package lsp-pyright
  :hook (python . lsp))

(use-package flymake
  :bind
  (:map flymake-mode-map
        ("C-c f n" . flymake-goto-next-error)))

(use-package company
  :custom
  (company-idle-delay 0.2)
  :bind
  (:map company-active-map
	("C-n". company-select-next)
	("C-p". company-select-previous)
	("M-<". company-select-first)
	("M->". company-select-last)))

(use-package org
  :ensure nil
  :custom
  (org-agenda-start-on-weekday 0)
  :bind
  (:map org-mode-map
        ("C-c c" . org-table-blank-field)
        ("C-c a" . org-agenda))
  :config
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
  :bind
  (:map Buffer-menu-mode-map
        ("M-<right>" . nil)
        ("M-<left>" . nil)))

(use-package multiple-cursors
  :bind ("C-c l" . mc/edit-lines))

(use-package jq-mode)

(use-package mustache-mode)

(use-package multi-line)

(use-package monokai-theme)

(use-package ispell
  :hook (text-mode . flyspell-mode))

(use-package yasnippet-snippets)

(use-package yasnippet
  :config
  (yas-reload-all)
  :hook (prog-mode . yas-minor-mode))
