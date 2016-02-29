(add-to-list 'load-path (locate-user-emacs-file "3rd-parties"))

(when (autoload-p 'sense-region-on "sense-region" "sense-region" 'interactive)
  (sense-region-on))

(load-p "ruby-style")

(load-p "trim-buffer")

(when (load-p "auto-save-buffers")
  (setq auto-save-buffers-regexp "^/[^:]+/")
  (run-with-idle-timer 3 t 'auto-save-buffers))
