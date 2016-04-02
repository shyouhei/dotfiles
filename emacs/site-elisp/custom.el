(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((change-log-indent-text . 2)
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
						t)))
     (style . ruby)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
