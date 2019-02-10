;; Minimal UI
(global-display-line-numbers-mode)
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(add-to-list 'default-frame-alist '(height . 160))
(add-to-list 'default-frame-alist '(width . 80))

;; Tell Emacs where is your personal theme directory
(add-to-list 'custom-theme-load-path (expand-file-name "themes"
                                                       user-emacs-directory))

(use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))

;(use-package smart-mode-line
;  :ensure t
;  :config
;  (setq sml/theme 'atom-one-dark)
;  (setq sml/no-confirm-load-theme t)
;  (sml/setup))

;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
;;(setq ns-use-proxy-icon  nil)
;;(setq frame-title-format nil)

;; Cursor
(setq-default cursor-type 'bar)

;; Font
(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
;               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
;               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
;               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-molokai t))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; All The Icons
(use-package all-the-icons :ensure t)

;; NeoTree
(use-package neotree
  :after all-the-icons
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Splash Screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; Seja bem-vindo de volta, Gustavo!\n;; Tu ne cede malis, sed contra audentior ito")
