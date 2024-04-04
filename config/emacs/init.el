(use-package autorevert
  :custom
  (global-auto-revert-mode t))

(use-package cus-edit
  :custom
  (custom-file (locate-user-emacs-file "custom.el")))

 (use-package custom
  :custom
  (custom-enabled-themes '(modus-vivendi))
  (menu-bar-mode nil))

(use-package elec-pair
  :custom
  (electric-pair-mode t))

(use-package icomplete
  :custom
  (fido-vertical-mode t))

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
