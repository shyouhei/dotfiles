(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (htmlize woman ansi-color tty-format company helm mic-paren
     w3m ggtags markdown-mode yaml-mode haml-mode slim-mode
     go-mode csharp-mode coffee-mode haskell-mode php-mode
     perl-mode electric-spacing ruby-electric ruby-block rbenv
     yard-mode ruby-mode exec-path-from-shell paradox diminish
     use-package)))
 '(safe-local-variable-values
   (quote
    ((style . ruby)
     (c-doc-comment-style . javadoc)
     (change-log-indent-text . 2)
     (add-log-time-format lambda
			  (&optional x y)
			  (let*
			      ((time
				(or x
				    (current-time)))
			       (system-time-locale "C")
			       (diff
				(+
				 (cadr time)
				 32400))
			       (lo
				(% diff 65536))
			       (hi
				(+
				 (car time)
				 (/ diff 65536))))
			    (format-time-string "%a %b %e %H:%M:%S %Y"
						(list hi lo)
						t)))
     (add-log-time-format lambda nil
			  (let*
			      ((time
				(current-time))
			       (system-time-locale "C")
			       (diff
				(+
				 (cadr time)
				 32400))
			       (lo
				(% diff 65536))
			       (hi
				(+
				 (car time)
				 (/ diff 65536))))
			    (format-time-string "%a %b %e %H:%M:%S %Y"
						(list hi lo)
						t)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
