;;; 非標準搭載のElispの設定
;; パッケージはel-getを使って管理する。導入するパッケージはこのファイルに次の書式で書けばいい。
;;
;; | ;;; パッケージ名
;; | (el-get 'sync '(パッケージ名))
;; | ...パッケージの設定
;;
;; 設定が長くなる場合は「packages/パッケージ名.el」というファイルをつくってそこに記述。
;;
;; | ;;; パッケージ名
;; | (load "packages/パッケージ名")
;;
;;


;;; el-get
;; 複数のソースからパッケージをインストールできるパッケージ管理システム
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))
;; レシピ置き場
(add-to-list 'el-get-recipe-path
             (concat (file-name-directory load-file-name) "/el-get/recipes"))
;; 追加のレシピ置き場
(add-to-list 'el-get-recipe-path
             "~/.emacs.d/config/el-get/local-recipes")


;;; auto Complete
;; 自動補完
(el-get 'sync '(auto-complete))
(load "packages/auto-complete.el")


;;; scss-mode
;; Scss(Sass)言語モード
(el-get 'sync '(scss-mode))
(load "packages/scss-mode.el")


;;; js2-mode
;; JavaScript言語モード
(el-get 'sync '(js2-mode))
(load "packages/js2-mode.el")

;;; php-mode
;; PHP言語モード
(el-get 'sync '(php-mode))
(load "packages/php-mode.el")

;;; web-mode
;;
(el-get 'sync '(web-mode))
(load "packages/web-mode.el")

;;; coffee-mode
;; CoffeeScript
(el-get 'sync '(coffee-mode))
(load "packages/coffee-mode.el")

;;; swig-mode
(el-get 'sync '(swig-mode))
(add-to-list 'auto-mode-alist '("\\.i$" . swig-mode))

;;; NCAR command language mode
(el-get 'sync '(ncl-mode))
(add-to-list 'auto-mode-alist '("\\.ncl$" . ncl-mode))
