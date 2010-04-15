;(global-set-key [f5]      'python-mode)
;(global-set-key [f6]     'doctest-mode)
;(global-set-key [f7]     'rst-mode)

(global-set-key [?\C-c ?c] 'copy-region-as-kill)
(define-key global-map "\M-g" 'goto-line)

(autoload 'matlab-mode "~/.emacs.d/matlab.el" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "~/.emacs.d/matlab.el" "Interactive Matlab mode." t)      

(require 'doctest-mode)
(add-to-list 'auto-mode-alist '("\\.doctest$" . doctest-mode))
(autoload 'doctest-mode "doctest-mode" "doctest mode" t)

;(require 'rst)
;(setq auto-mode-alist
;      (append '(("\\.txt$" . rst-mode)
;                ("\\.rst$" . rst-mode)
;                ("\\.rest$" . rst-mode)) auto-mode-alist))

(setq frame-background-mode 'dark)

(add-hook 'python-mode-hook 'my-python-hook)
; this gets called by outline to deteremine the level. Just use the length of the whitespace
(defun py-outline-level ()
  (let (buffer-invisibility-spec)
    (save-excursion
      (skip-chars-forward "\t ")
      (current-column))))
; this get called after python mode is enabled
(defun my-python-hook ()
  ; outline uses this regexp to find headers. I match lines with no indent and indented "class"
  ; and "def" lines.
  (setq outline-regexp "[^ \t]\\|[ \t]*\\(def\\|class\\) ")
  ; enable our level computation
  (setq outline-level 'py-outline-level)
  ; do not use their \C-c@ prefix, too hard to type. Note this overides some python mode bindings
  (setq outline-minor-mode-prefix "\C-c")
  ; turn on outline mode
  (outline-minor-mode t)
  ; initially hide all but the headers
  (hide-body)
  ; I use CUA mode on the PC so I rebind these to make the more accessible
;  (local-set-key [?\C-\t] 'py-shift-region-right)
;  (local-set-key [?\C-\S-\t] 'py-shift-region-left)
  ; make paren matches visible
  (show-paren-mode 1)
) 

; (global-font-lock-mode 1 t)
(set-default-font "-apple-courier new-medium-r-normal--0-0-0-0-m-0-mac-roman")

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
        (add-to-list 'default-frame-alist (cons 'width (/ (- (/ (x-display-pixel-width) 2) 10) (frame-char-width))))
      (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
                 (cons 'height (/ (- (x-display-pixel-height) 50) (frame-char-height)))))))

(set-frame-size-according-to-resolution)

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(set-fill-column 79)