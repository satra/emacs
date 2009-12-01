;; http://www.emacswiki.org/emacs/ExecPath
;; http://xahlee.org/emacs/emacs_env_var_paths.html
(when (string-equal system-type "darwin")
  (progn
    ;; am on mac
    (setenv "PYTHONPATH" "~/sp")
    (setq exec-path
          (append
	   '("~/usr/local/bin")
	   exec-path
	   )
          )
    )
  )
