(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "site-elisp"))
(load "utils")
(load "packages")
(load "3rd-parties")
(load "configs")
(load "custom")
