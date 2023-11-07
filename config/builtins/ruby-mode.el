;;; ruby-mode

(add-hook
 'ruby-mode-hook
 (lambda ()
   ;; インデント幅
   (setq ruby-indent-level 2)
   ;; マジックコメントを挿入しない
   (setq ruby-insert-encoding-magic-comment nil)))
