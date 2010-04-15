;; setup for rst mode
;; rst mode hooks
(require 'rst)
(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
		("\\.rest$" . rst-mode)) auto-mode-alist))
