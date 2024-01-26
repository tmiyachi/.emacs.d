;;; js-mode

(add-hook 'js-mode-hook
  (lambda ()
    (make-local-variable 'js-indent-level)
    
    ;; スペースでインデントをする
    (setq indent-tabs-mode nil)
    ;; インデント幅を2にする
    (setq js-indent-level 2)))