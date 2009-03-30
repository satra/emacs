;; setup for rst mode
;; rst mode hooks
(require 'rst)
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
		("\\.rest$" . rst-mode)) auto-mode-alist))
