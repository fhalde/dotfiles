;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Faiz Halde"
      user-mail-address "faiz.halde@nubank.com.br")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "FiraMono Nerd Font Mono" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; my config

;; smoothly go to next line on EOL (forward)
(setq-default evil-cross-lines nil)
;; blink
(blink-cursor-mode 1)
;; full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-company-mode t)

(setq lsp-clojure-custom-server-command '("bash" "-c" "/usr/local/bin/clojure-lsp"))
(add-hook 'clojure-mode-hook
          (lambda ()
            (smartparens-mode nil)
            (paredit-mode 1)
            (define-key clojure-mode-map (kbd "s-]") 'paredit-forward-slurp-sexp)
            (define-key clojure-mode-map (kbd "s-[") 'paredit-backward-slurp-sexp)
            (define-key clojure-mode-map (kbd "s-}") 'paredit-forward-barf-sexp)
            (define-key clojure-mode-map (kbd "s-{") 'paredit-backward-barf-sexp)
            (define-key clojure-mode-map (kbd "s-r") 'paredit-raise-sexp)
            (define-key clojure-mode-map (kbd "s-,") 'xref-pop-marker-stack)
            (define-key clojure-mode-map (kbd "s-.") 'xref-find-definitions)))

(add-hook 'lisp-mode-hook
          (lambda ()
            (smartparens-mode nil)
            (paredit-mode 1)
            (define-key clojure-mode-map (kbd "s-]") 'paredit-forward-slurp-sexp)
            (define-key clojure-mode-map (kbd "s-[") 'paredit-backward-slurp-sexp)
            (define-key clojure-mode-map (kbd "s-}") 'paredit-forward-barf-sexp)
            (define-key clojure-mode-map (kbd "s-{") 'paredit-backward-barf-sexp)
            (define-key clojure-mode-map (kbd "s-.") 'xref-find-definitions)))


(add-hook 'helm-find-files-before-init-hook
          (lambda ()
            (define-key helm-find-files-map (kbd "C-<backspace>") nil)))

(add-hook 'cider-mode-hook
          (lambda ()
            (setq cider-test-defining-forms '("deftest" "defspec" "defflow"))
            (define-key cider-mode-map (kbd "<s-up>") 'cider-repl-previous-input)
            (define-key cider-mode-map (kbd "<s-down>") 'cider-repl-next-input)
            (define-key cider-mode-map (kbd "s-]") 'paredit-forward-slurp-sexp)
            (define-key cider-mode-map (kbd "s-[") 'paredit-backward-slurp-sexp)
            (define-key cider-mode-map (kbd "s-}") 'paredit-forward-barf-sexp)
            (define-key cider-mode-map (kbd "s-{") 'paredit-backward-barf-sexp)
            (define-key cider-mode-map (kbd "s-.") 'xref-find-definitions)
            (define-key cider-mode-map (kbd "C-x C-n") 'cider-repl-set-ns)
            (define-key cider-mode-map (kbd "C-x C-r") 'cider-switch-to-repl-buffer)
            (define-key cider-mode-map (kbd "s-,") 'xref-pop-marker-stack)))

(setq doom-variable-pitch-font (font-spec :family "FiraMono Nerd Font Mono" :size 13))
(setq doom-themes-treemacs-enable-variable-pitch nil)

(add-hook 'centaur-tabs-mode-hook
          (lambda ()
            (define-key centaur-tabs-mode-map (kbd "C-s-[") 'centaur-tabs-backward-tab)
            (define-key centaur-tabs-mode-map (kbd "C-s-]") 'centaur-tabs-forward-tab)))

(global-set-key (kbd "C-s-]") 'centaur-tabs-forward-tab)
(global-set-key (kbd "C-s-[") 'centaur-tabs-backward-tab)
(global-set-key (kbd "C-s-\\") 'treemacs-select-window)

(require 'flycheck-clj-kondo)
(visual-line-mode t)
(global-visual-line-mode t)

(global-set-key (kbd "s-.") 'xref-find-definitions)
(global-set-key (kbd "s-,") 'xref-pop-marker-stack)
(global-set-key (kbd "s-*") '+default/search-project-for-symbol-at-point)

(setq-default +workspaces-on-switch-project-behavior nil)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers
(setq uniquify-strip-common-suffix t)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(add-hook 'doom-first-file-hook
          (lambda ()
            (call-interactively 'toggle-uniquify-buffer-names)))
