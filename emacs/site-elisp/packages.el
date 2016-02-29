(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("user42" . "http://download.tuxfamily.org/user42/elpa/packages/"))

(package-initialize)
(eval-when-compile
  (require 'use-package))

(package-install 'diminish)
(use-package diminish
  :config
  (progn
    (defun-add-hook 'lisp-interaction-mode-hook (setq mode-name "Lisp"))
    (defun-add-hook 'emacs-lisp-mode-hook (setq mode-name "elisp"))
    (defun-add-hook 'texinfo-mode-hook (setq mode-name "texi"))
    (defun-add-hook 'change-log-mode-hook (setq mode-name "CL"))
    (diminish 'isearch-mode)))

(package-install 'use-package)
(use-package use-package)

(package-install 'paradox)
(use-package paradox :init (setq paradox-github-token t))

(package-install 'ruby-mode)
(package-install 'yard-mode)
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
    (defun-add-hook 'ruby-mode-hook (auto-fill-mode 1))
    (use-package yard-mode
      :defer t
      :init
      (progn
	(add-hook 'ruby-mode-hook 'yard-mode)
	(add-hook 'ruby-mode-hook 'eldoc-mode)))))

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
  (defun-add-hook 'perl-mode-hook
    (auto-fill-mode -1)
    (setq indent-tabs-mode nil)))

(package-install 'php-mode)
(use-package php-mode
  :interpreter "php"

  :mode "\\.php$"

  :init (defun-add-hook 'php-mode-hook (auto-fill-mode 1)))

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
  (defun-add-hook 'coffee-mode-hook
    (set (make-local-variable 'tab-width) 2)))

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

(package-install 'gtags)
(use-package gtags
  :defer t
  :diminish "G"
  :init
  (progn
    (defun-add-hook 'gtags-mode-hook
      (local-set-key "\M-f" 'gtags-find-tag)    ; override etags
      (local-set-key "\M-r" 'gtags-find-rtag)   ; reverse tag
      (local-set-key "\M-s" 'gtags-find-symbol) ; find
      (local-set-key "\C-t" 'gtags-pop-stack)); pop
    ;; C-mode forces gtags
    (defun-add-hook 'c-mode-common-hook (gtags-mode 1))))

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

;; Emacs built-in
(use-package windmove
  :config
  (progn
    (windmove-default-keybindings)
    (setq windmove-wrap-around t)))

(package-install 'tty-format)
(use-package tty-format :config (add-hook 'find-file-hooks 'tty-format-guess))

;; Emacs built-in
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
