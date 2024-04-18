(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)

  (use-package autorevert
    :custom
    (global-auto-revert-mode t))

  (use-package cus-edit
    :custom
    (custom-file (locate-user-emacs-file "custom.el")))

  (use-package cus-start
    :defer t
    :custom
    (create-lockfiles nil)
    (menu-bar-mode nil)
    (tool-bar-mode nil)
    (use-short-answers t))

  (use-package custom
    :custom
    (custom-enabled-themes '(modus-vivendi)))

  (use-package elec-pair
    :custom
    (electric-pair-mode t))

  (use-package files
    :custom
    (auto-save-default nil)
    (make-backup-files nil))

  (use-package icomplete
    :custom
    (fido-vertical-mode t))

  (use-package scroll-bar
    :custom
    (scroll-bar-mode nil))

  (use-package simple
    :custom
    (column-number-mode t)
    :bind*
    ("C-h" . delete-backward-char))

  (use-package startup
    :defer t
    :custom
    (inhibit-startup-screen t))

  (use-package whitespace
    :custom
    (global-whitespace-mode t))

  (use-package corfu
    :ensure t
    :custom
    (corfu-auto t)
    :init
    (global-corfu-mode 1))

  (use-package diff-hl
    :ensure t
    :custom
    (global-diff-hl-mode t))

  (use-package editorconfig
    :ensure t
    :custom
    (editorconfig-mode t))

  (use-package meow
    :ensure t
    :custom
    (meow-use-cursor-position-hack t)
    :config
    (load (locate-user-emacs-file "meow-qwerty.el"))
    (meow-setup)
    (meow-global-mode 1)))
