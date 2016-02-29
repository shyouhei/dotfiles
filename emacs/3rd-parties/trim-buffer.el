(defun trim-buffer ()
  "garbage collect"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match "" nil nil))
	  (goto-char (point-max))
    (delete-blank-lines)))
