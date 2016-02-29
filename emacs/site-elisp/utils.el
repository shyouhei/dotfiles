;; CF http://www.sodan.org/~knagano/emacs/dotemacs.html

(defun autoload-p (function file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (and (locate-library file)
       (autoload function file docstring interactive type)))
(defmacro defun-add-hook (hookname &rest sexplist)
  "pack the sexp list into function and call add-hook"
  `(add-hook ,hookname
	     (function (lambda () ,@sexplist))))
(defun load-p (loadlib)
  "TRY to load and not stop"
  ;; read the library with missing-ok and if not, leave a message.
  (let ((load-status (load loadlib t)))
    (or load-status
	(message (format "failed to load %s" loadlib)))
    load-status))
