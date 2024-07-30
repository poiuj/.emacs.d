(require 'package)

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
  :bind ("C-c m" . magit-status))

(use-package paredit
  :config
  (dolist (hook '(emacs-lisp-mode-hook
                  lisp-interaction-mode-hook))
    (add-hook hook #'paredit-mode))
  ;; conflicts with windmove
  (unbind-key "<M-up>" paredit-mode-map)
  (unbind-key "<M-down>" paredit-mode-map)
  ;; conflicts with xref find references
  (unbind-key "M-?" paredit-mode-map))

(use-package flycheck)

(use-package lsp-mode
  :custom
  (lsp-enable-snippet nil)
  (lsp-idle-delay 0.5)
  :bind
  (:map lsp-mode-map
        ("C-c l ." . lsp-find-implementation)
        ("C-c l r" . lsp-rename))
  :hook (c-mode . lsp))

(use-package rustic
  :config
  (push 'rustic-clippy flycheck-checkers)
  :custom
  (rustic-lsp-server 'rust-analyzer))

(use-package lsp-pyright
  :hook (python . lsp))

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

(use-package ispell
  :hook (text-mode . flyspell-mode))

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
  (completion-category-override '((file (styles basic partial-completion)))))

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package ag)

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ([remap goto-line] . consult-goto-line)
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
  ("C-x v s" . git-gutter:stage-hunk))

(use-package gdb-mi
  :ensure nil
  :custom
  (gdb-many-windows t))
