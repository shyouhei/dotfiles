;; custom
(setq custom-file (expand-file-name "~/.emacs.d/elisp/custom.el"))

;; whoami
(setq user-full-name "URABE Shyouhei")
(setq user-mail-address "shyouhei@ruby-lang.org")

(setq global-mode-string nil)
(setq frame-title-format
      '("-%z:%*%+  %b  "
        mode-line-modes
        which-func-format
        "--"
        invocation-name
        "@"
        system-name))

(which-func-mode)

(blink-cursor-mode -1)

(tool-bar-mode -1)

(menu-bar-mode -1)

(scroll-bar-mode -1)

(mouse-wheel-mode 1)

(xterm-mouse-mode 1)

(fringe-mode 0)

;; (display-time)

(line-number-mode t)

(column-number-mode t)

(set-variable 'truncate-partial-width-windows nil)

(auto-image-file-mode)

(setq backup-directory-alist
      '(("." . "~/.emacs.d/backups")))

;; transient-mark
(setq transient-mark-mode t)

(setq search-highlight t)
(setq query-replace-highlight t)
;;(setq isearch-lazy-highlight-initial-delay 0) ; obsolate
(setq lazy-highlight-initial-delay 0)

(setq backup-by-copying t)

(setq gc-cons-threshold 1000000)

(setq inhibit-startup-message t)

(setq visible-bell nil)

(setq font-lock-maximum-size nil)

;; ;; fast-lock
;; (setq font-lock-support-mode 'fast-lock-mode)
;; (setq fast-lock-cache-directories '("~/.emacs.d/emacs-flc"))

(setq auto-save-list-file-prefix "~/.emacs.d/auto-save-list/.saves-")

(setq require-final-newline t)

;; (setq temporary-file-directory "~/.emacs.d/tmp")
(setq temporary-file-directory "/dev/shm")

(setq scroll-step 1)
(setq scroll-conservatively 1)

(setq next-line-add-newlines nil)

(setq fill-column 79)
(defun-add-hook 'c-mode-common-hook (auto-fill-mode 1))

(setq message-log-max 200)

(auto-compression-mode t)

(setq apropos-do-all t)

;;(delete-selection-mode t)
;; or...
;;(pc-selection-mode t)

;; abbrev
(read-abbrev-file "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)

;; version control
;; (setq vc-follow-symlinks t)
;; (setq vc-suppress-confirm t)
;; (setq vc-command-messages t)

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(global-set-key "\M-V" 'scroll-other-window-down)

(setq cursor-in-non-selected-windows nil)

(setq-default indicate-empty-lines t)

;; (setq-default line-spacing 0)

;; No more bobcat, no more keyswap!
(cond ((eq window-system 'x)
       (progn
         (global-set-key [delete] 'delete-char)))
      ((eq window-system 'mac)
       t) ;; ok
      (t (keyboard-translate ?\C-h ?\C-?)))

;; Anthy! Anthy!
;; (set-input-method "japanese-anthy")
;; (set-input-method "japanese-prime")

(set-language-environment 'Japanese)
;; (set-default-coding-systems 'euc-jp-unix)
;; (set-buffer-file-coding-system 'euc-jp-unix)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'euc-jp-unix)
;; (setq file-name-coding-system 'euc-jp-unix)
;; (set-clipboard-coding-system 'iso-2022-jp-unix)
;; (setq default-process-coding-system '(undecided . euc-jp-unix))
(set-default-coding-systems 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
(setq file-name-coding-system 'utf-8-mac)
(set-clipboard-coding-system 'utf-8-unix)
(setq default-process-coding-system '(undecided . utf-8-unix))

(defun-add-hook 'c-mode-common-hook
  (c-set-style "Stroustrup")
  (c-toggle-hungry-state 1)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (electric-pair-mode t)
  (electric-layout-mode t)
  (add-to-list 'electric-layout-rules '(?{ . after))
  (electric-spacing-mode))

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

(global-set-key "\C-h" 'delete-backward-char)

(if window-system
    (progn
      (set-face-attribute 'default nil :family "Ricty" :height 140)
      (set-fontset-font "fontset-default" 'japanese-jisx0208 '("Ricty" . "iso10646-*"))
      (setq default-frame-alist
            (append
             (list '(foreground-color . "black")
                   '(background-color . "alice blue")
                   '(border-color . "azure")
                   '(cursor-color . "black")
                   '(mouse-color . "orange")
                   '(vertical-scroll-bars . nil)
                   ;; '(alpha . 65)
                   )
             default-frame-alist))))
