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
  (setq vc-follow-symlinks t)
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq comp-async-report-warnings-errors nil)
  (setq-default tab-width 4))

(use-package dracula-theme
  :config
  (load-theme 'dracula t))

(use-package goto-line-preview
  :bind ([remap goto-line] . goto-line-preview))

(use-package rainbow-mode
  :hook
  (prog-mode . rainbow-mode)
  (text-mode . rainbow-mode))

(use-package corfu
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t)
  (setq corfu-cycle t)
  (setq corfu-count 8)
  (setq corfu-auto-delay 0)
  (setq corfu-auto-prefix 2)
  (setq corfu-scroll-margin 2)
  (setq corfu-quit-no-match t)
  (setq corfu-preselect-first t)
  (setq corfu-preview-current 'insert)
  (setq completion-cycle-threshold nil))

(use-package corfu-history
  :after corfu
  :config
  (corfu-history-mode))

(use-package corfu-doc
  :after corfu
  :config
  (corfu-doc-mode))

(use-package kind-icon
  :after corfu
  :config
  (setq kind-icon-default-face 'corfu-default)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package eglot
  :config
  (setq eglot-events-buffer-size 0)
  (setq eglot-ignored-server-capabilities '(:hoverProvider :signatureHelpProvider))
  :hook
  (python-mode . eglot-ensure)
  (sh-mode . eglot-ensure)
  (rust-mode . eglot-ensure)
  (before-save . eglot-format-buffer))

(use-package eldoc-box
  :bind (("C-c h" . eldoc-box-help-at-point)
		 :map eglot-mode-map
		 ("C-c h" . eldoc-box-eglot-help-at-point)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode eldoc-box pyvenv rust-mode kind-icon corfu-doc corfu rainbow-mode goto-line-preview goto-line-mode goto-line dracula-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
