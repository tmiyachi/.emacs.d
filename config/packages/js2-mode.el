;;; js2-mode
;; JavaScript言語モード
;(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(defun js2-custom ()
  "js2-mode-hook"
  (and
   (set (make-local-variable 'js2-basic-offset) 2)         ; インデント幅を2にする
   )
  )
(add-hook 'js2-mode-hook
          '(lambda() (js2-custom)))

