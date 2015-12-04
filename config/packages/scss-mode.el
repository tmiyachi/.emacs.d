;;; scss-mode 
;; Scss(Sass)言語モード
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)         ; インデント幅を2にする
   (set (make-local-variable 'scss-compile-at-save) nil)    ;; 自動コンパイルをオフ
   )
  )
(add-hook 'scss-mode-hook
  '(lambda() (scss-custom)))
