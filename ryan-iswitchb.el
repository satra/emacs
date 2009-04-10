;I usually have a LOT of buffers open,
;this keeps the size of iswitchb minibuffer more manageable.
(add-hook 'iswitchb-minibuffer-setup-hook
	  '(lambda () (set (make-local-variable 'max-mini-window-height) 3)))

;; The default key bindings to select a buffer might annoy some. Even
;; more annoying is the fact that the left/right keys don’t work, and
;; the up/down keys unhelpfully bring up old iswitchb lists which might
;; even be out of date. With that in mind, this will allow left/right
;; arrow key navigation of the buffer list, and deactivate up/down in
;; iswitchb.
;; from http://www.emacswiki.org/emacs/IswitchBuffers
(defun iswitchb-local-keys ()
  (mapc (lambda (K) 
          (let* ((key (car K)) (fun (cdr K)))
            (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
        '(("<right>" . iswitchb-next-match)
          ("<left>"  . iswitchb-prev-match)
          ("<up>"    . ignore             )
          ("<down>"  . ignore             ))))

(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

