;; パッケージはEmacs24から標準搭載されているpackage.elを使って管理する。
;; 導入するパッケージはこのファイルに次の書式で書けばいい。
;;
;; | ;;; パッケージ名
;; | (package-ensure-install 'パッケージ名)
;;
;; 設定が長くなる場合は「packages/パッケージ名.el」というファイルをつくってそこに記述。
;;
;; | ;;; パッケージ名
;; | (load "packages/パッケージ名")
;;
;;

;;; package.el
;; Emacs標準のパッケージ管理システム
(require 'package)

;; パッケージリストを上書き
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

;; 初期化
(package-initialize)
;; 初回起動時はパッケージリストを更新
(unless package-archive-contents
  (package-refresh-contents))

;; インストールされていなかったらインストールする関数
(defun package-ensure-install (name)
  (unless (package-installed-p name)
        (package-install name)))
