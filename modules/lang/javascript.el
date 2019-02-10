;;; package --- javascript module

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (setq flycheck-pos-tip-timeout 10
        flycheck-display-errors-delay 0.5)
  (flycheck-pos-tip-mode +1))


(add-to-list 'load-path "~/Documents/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
;(autoload 'tern-mode "tern-auto-complete.el" nil t)
;(eval-after-load 'tern
;   '(progn
;      (require 'tern-auto-complete)
 ;     (tern-ac-setup)))
(add-hook 'rjsx-mode-hook (lambda () (tern-mode t)))

(use-package rjsx-mode
  :ensure t
  :commands rjsx-mode
  :mode "\\.js$")

(setq js2-basic-offset 2)
