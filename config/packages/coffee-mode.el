;;; coffee-mode
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(defun coffee-custom ()
  "coffee-mode-hook"
  (and
   (set (make-local-variable 'tab-width) 2)        ;インデント幅を2にする
   (set (make-local-variable 'coffee-tab-width) 2) ;インデント幅を2にする
   )
  )
(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

