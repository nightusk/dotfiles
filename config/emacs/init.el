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
  (tool-bar-mode nil))

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
  (normal-erase-is-backspace t))

(use-package whitespace
  :custom
  (global-whitespace-mode t))

(use-package editorconfig
  :ensure t
  :custom
  (editorconfig-mode t))
