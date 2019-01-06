(require 'package)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("user42" . "http://download.tuxfamily.org/user42/elpa/packages/"))

(package-initialize)

(package-install 'use-package)
(eval-when-compile
  (require 'use-package))

(package-install 'diminish)
(use-package use-package
  :init
  (use-package diminish
    :config
    (progn
      (add-hook 'lisp-interaction-mode-hook (lambda () (setq mode-name "Lisp")))
      (add-hook 'emacs-lisp-mode-hook (lambda () (setq mode-name "elisp")))
      (add-hook 'texinfo-mode-hook (lambda () (setq mode-name "texi")))
      (add-hook 'change-log-mode-hook (lambda () (setq mode-name "CL")))
      (diminish 'isearch-mode))))

(package-install 'paradox)
(use-package paradox :init (setq paradox-github-token t))

(package-install 'exec-path-from-shell)
(use-package exec-path-from-shell
  :if     (memq window-system '(mac ns))
  :init   (setenv "SHELL" "/usr/local/bin/zsh")
  :config (exec-path-from-shell-initialize))

(package-install 'ruby-mode)
(package-install 'yard-mode)
(package-install 'rbenv)
(package-install 'ruby-block)
(package-install 'ruby-electric)
(package-install 'electric-spacing)
(use-package ruby-mode
  :interpreter "ruby"

  :mode
  (("\\.rb$" . ruby-mode)
   ("\\.erb$" . html-mode) ;; <- !!
   ("\\.gemspec$" . ruby-mode)
   ("/config\\.ru$" . ruby-mode)
   ("/Gemfile$" . ruby-mode)
   ("/Rakefile$" . ruby-mode)
   ("/Cakefile$" . ruby-mode)
   ("/Capfile$" . ruby-mode))

  :init
  (progn
    (add-hook 'ruby-mode-hook (lambda () (auto-fill-mode 1)))
    (use-package yard-mode
      :defer t
      :init
      (progn
        (add-hook 'ruby-mode-hook 'yard-mode)
        (add-hook 'ruby-mode-hook 'eldoc-mode)))
    (use-package ruby-electric
      :defer t
      :init (add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t))))
    (use-package electric-spacing
      :defer t
      :init
      (progn
	(add-hook 'ruby-mode-hook 'electric-spacing-mode)
	(add-hook 'c-mode-common-hook 'electric-spacing-mode)))
    (use-package rbenv
      :init (setq rbenv-installation-dir "~/data/etc/rbenv")
      :config (global-rbenv-mode))
    (use-package ruby-block
      :commands ruby-block-mode
      :config (setq ruby-block-highlight-toggle t))))

(package-install 'perl-mode)
(use-package perl-mode
  :interpreter "perl"

  :mode
  (("\\.pl$" . perl-mode)
   ("\\.pm$" . perl-mode)
   ("\\.psgi$" . perl-mode)
   ("Makefile\\.PL$" . perl-mode)
   ("/t/.+\\.t$" . perl-mode))

  :init
  (add-hook 'perl-mode-hook
            (lambda ()
              (auto-fill-mode -1)
              (setq indent-tabs-mode nil))))

(package-install 'php-mode)
(use-package php-mode
  :interpreter "php"

  :mode "\\.php$"

  :init (add-hook 'php-mode-hook (lambda () (auto-fill-mode 1))))

(package-install 'haskell-mode)
(use-package haskell-mode
  :interpreter "hugs"

  :mode
  (("\\.hs$" . haskell-mode)
   ("\\.hi$" . haskell-mode)
   ("\\.gs$" . haskell-mode)
   ("\\.lhs$" . haskell-mode)
   ("\\.lgs$" . haskell-mode))

  :init
  (progn
    (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
    (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)))

(package-install 'coffee-mode)
(use-package coffee-mode
  :mode
  (("\\.coffee$" . coffee-mode)
   ("\\.Cakefile$" . coffee-mode))
  
  :init
  (add-hook 'coffee-mode-hook
            (lambda ()
              (set (make-local-variable 'tab-width) 2))))

(package-install 'csharp-mode)
(use-package csharp-mode :mode "\\.cs$")

(package-install 'go-mode)
(use-package go-mode :mode "\\.go$")

(package-install 'slim-mode)
(use-package slim-mode :mode "\\.slim$")

(package-install 'haml-mode)
(use-package haml-mode :mode "\\.haml$")

(package-install 'yaml-mode)
(use-package yaml-mode
  :mode
  (("\\.yml$" . yaml-mode)
   ("\\.yaml$" . yaml-mode)
   ("\\.yml\\.erb$" . yaml-mode)))

(package-install 'markdown-mode)
(use-package markdown-mode
  :mode
  (("\\.markdown$" . markdown-mode)
   ("\\.mkdn$" . markdown-mode)
   ("\\.md$" . markdown-mode)))

(package-install 'cmake-mode)
(use-package cmake-mode :mode "^CMakeList\\.txt$")

(package-install 'ggtags)
(use-package ggtags
  :commands ggtags-mode
  :diminish "GG"
  :init
  (progn
    (add-hook 'c-mode-common-hook
	      (lambda ()
		(when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		  (ggtags-mode 1))))
    ;; use helm
    (setq ggtags-completing-read-function nil)))

(package-install 'w3m)
(use-package w3m
  :commands (w3m-browse-url w3m-session-crash-recovery-remove)

  :init
  (eval-when-compile
    (autoload 'w3m-search-escape-query-string "w3m-search")))

(package-install 'mic-paren)
(use-package mic-paren
  :config
  (progn
    (show-paren-mode t)
    (paren-activate)))

(package-install 'helm)
(use-package helm
  :ensure t
  :diminish "helm"
  :init
  (progn
    (require 'helm-config)
    (helm-mode 1)
    (define-key helm-map (kbd "C-h") 'delete-backward-char)
    (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))

(package-install 'company)
(use-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-backends (delete 'company-semantic company-backends))
    (setq company-backends (delete 'company-clang    company-backends))))

;; Emacs built-in
(use-package windmove
  :config
  (progn
    (windmove-default-keybindings)
    (setq windmove-wrap-around t)))

(package-install 'tty-format)
(use-package tty-format :config (add-hook 'find-file-hooks 'tty-format-guess))

(package-install 'ansi-color)
(use-package ansi-color
  :mode
  (("\\.log$" . display-ansi-colors))

  :config
  (progn
    ;; http://stackoverflow.com/a/23382008
    (defun display-ansi-colors ()
      (interactive)
      (let ((inhibit-read-only t))
        (ansi-color-apply-on-region (point-min) (point-max))))))

;; Emacs built-in
(use-package uniquify :config (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

;; M-x woman
(package-install 'woman)
(use-package woman :config (setq woman-cache-filename (expand-file-name "~/.emacs.d/woman-cache")))

(package-install 'htmlize)
(use-package htmlize)

(package-install 'editorconfig)
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(package-install 'whitespace)
(package-install 'unicode-whitespace)
(use-package unicode-whitespace
  :config (unicode-whitespace-setup))
(use-package whitespace
  :config
  (progn
    (add-hook 'ruby-mode-hook (lambda () (whitespace-mode 1)))
    (add-hook 'c-mode-common-hook (lambda () (whitespace-mode 1)))
    (setq whitespace-style '(face
                             trailing
                             tabs
                             spaces
                             lines-tail
                             newline
                             empty
                             indentation
                             space-after-tab
                             space-before-tab
                             space-mark
                             tab-mark
                             ))
    (set-face-background 'whitespace-newline 'nil)
    (set-face-background 'whitespace-space 'nil)))
