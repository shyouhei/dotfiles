;;
;; このコードは山岡克美氏が書いてくださった (ELF:01128)
;;
;; (require 'auto-save-buffers)
;; (run-with-idle-timer 0.5 t 'auto-save-buffers) ; アイドル0.5秒で保存
;;

;; auto-save-buffers で対象とするファイルの正規表現
(defvar auto-save-buffers-regexp ""
  "*Regexp that matches `buffer-file-name' to be auto-saved.")

(defun auto-save-buffers ()
  "Save buffers if `buffer-file-name' matches `auto-save-buffers-regexp'."
  (let ((buffers (buffer-list))
	buffer)
    (save-excursion
      (while buffers
	(set-buffer (car buffers))
	(if (and buffer-file-name
		 (buffer-modified-p)
		 (not buffer-read-only)
		 (string-match auto-save-buffers-regexp buffer-file-name)
		 (file-writable-p buffer-file-name))
	    (save-buffer))
	(setq buffers (cdr buffers))))))

;;
;; Emacs 21 以降で Makefile の編集時に "Suspicious line XXX. Save anyway"
;; というプロンプトを出さないようにするためのおまじない
;;
(add-hook 'makefile-mode-hook
	  (function (lambda ()
		      (fset 'makefile-warn-suspicious-lines 'ignore))))

(provide 'auto-save-buffers)
