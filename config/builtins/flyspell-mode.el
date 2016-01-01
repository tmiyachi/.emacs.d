;;; flyspell-mode
;; スペルチェック

;; M-TABのキーバインドを変更しない
(setq flyspell-use-meta-tab nil)

;; テキスト編集時は自動スペルチェック機能を有効にする
(mapc
 (lambda (hook)
   (add-hook hook 'flyspell-mode))
 '(text-mode-hook))
;; プログラムを書いているときはコメントの中でだけ自動スペルチェック機能を有効にする
(mapc
 (lambda (hook)
   (add-hook hook 'flyspell-prog-mode))
 '(prog-mode-hook
   ruby-mode-hook))

;; スペルチェックには英語の辞書を使う
(setq ispell-dictionary "american")
