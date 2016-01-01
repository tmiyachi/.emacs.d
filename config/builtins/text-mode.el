;;; text-mode
;; テキスト編集用のモード

;; text-modeでバッファーを開いたときに行う設定
(add-hook
 'text-mode-hook
 (lambda ()
   ;; スペースでインデントする
   (setq indent-tabs-mode nil)))
