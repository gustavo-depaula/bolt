;(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/modules")
;(add-to-list 'load-path "~/.emacs.d/modules/lang")
(load "packages")
(load "ui")
(load "javascript")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "f66ffeadda7b52d40c8d698967ae9e9836f54324445af95610d257fa5e3e1e21" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (web-mode tss typescript-mode helm-ag rust-mode poet-theme company-anaconda anaconda-eldoc-mode doom-modeline anaconda-mode markdown-mode nvm magit smart-mode-line-atom-one-dark-theme smart-mode-line flycheck-pos-tip company-tern exec-path-from-shell flycheck company rjsx-mode load-dir rainbow-delimiters neotree projectile helm doom-themes use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package exec-path-from-shell
	     :ensure t
	     :init
	     (when (memq window-system '(mac ns x))
	       (exec-path-from-shell-initialize))
	     (setq exec-path (append exec-path '("~/.nvm/versions/node/v6.15.1/bin"))))
	     

;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
  helm-mode-fuzzy-match t
  helm-buffers-fuzzy-matching t
  helm-recentf-fuzzy-match t
  helm-locate-fuzzy-match t
  helm-semantic-fuzzy-match t
  helm-imenu-fuzzy-match t
  helm-completion-in-region-fuzzy-match t
  helm-candidate-number-list 150
  helm-split-window-in-side-p t
  helm-move-to-line-cycle-in-source t
  helm-echo-input-in-header-line t
  helm-autoresize-max-height 0
  helm-autoresize-min-height 20)
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)
  (helm-mode 1))

(use-package company-tern
  :ensure t)
(use-package company-anaconda
  :ensure t)
(use-package company
  :after (company-tern company-anaconda)
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern)
  (add-to-list 'company-backends 'company-anaconda)
  (add-hook 'after-init-hook 'global-company-mode))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

(electric-pair-mode 1)

(use-package magit
  :ensure t)

(use-package anaconda-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package rust-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))
