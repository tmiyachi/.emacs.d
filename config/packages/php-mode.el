(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;(defun php-custom ()
;  "php-mode-hook"
;  (and
;   (set (make-local-variable 'css-indent-offset) 2)      ;   ; インデント幅を2にする
;   (set (make-local-variable 'scss-compile-at-save) nil) ;   ;; 自動コンパイルをオフ
;   )
;  )
;(add-hook 'php-mode-hook
;  '(lambda() (php-custom)))
