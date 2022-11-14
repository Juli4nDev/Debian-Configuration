(require 'package)

(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package emacs
  :config
  (ido-mode 1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (show-paren-mode 1)
  (scroll-bar-mode -1)
  (delete-selection-mode 1)
  (windmove-default-keybindings)
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq-default tab-width 4))

(use-package dracula-theme
  :config
  (load-theme 'dracula t))

(use-package eglot
  :hook (python-mode . eglot-ensure))

(use-package goto-line-preview
  :bind ([remap goto-line] . goto-line-preview))

(use-package rainbow-mode
  :hook
  (prog-mode-hook . rainbow-mode)
  (text-mode . rainbow-mode))  

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rainbow-mode goto-line-preview goto-line-mode goto-line dracula-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
