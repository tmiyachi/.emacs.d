;; パッケージはpackage.elもしくはel-getを使って管理する。
;; 導入するパッケージはこのファイルに次の書式で書けばいい。
;;
;; * package.elを利用する場合 *
;; | ;;; パッケージ名
;; | (package-ensure-install 'パッケージ名)
;;
;; * el-getを利用する場合*
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

;;; web-mode
;;
(el-get 'sync '(web-mode))
(load "packages/web-mode.el")

;;; python-mode with flake8
(package-ensure-install 'flymake)
(package-ensure-install 'flymake-python-pyflakes)
(when (executable-find "flake8")
  (require 'flymake-python-pyflakes)
  (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
  (setq flymake-python-pyflakes-executable "flake8")
  (defun flymake-show-help ()
    (when (get-char-property (point) 'flymake-overlay)
      (let ((help (get-char-property (point) 'help-echo)))
        (if help (message "%s" help)))))
  (add-hook 'post-command-hook 'flymake-show-help)
  (setq flymake-python-pyflakes-extra-arguments '("--ignore=D,W293,W503" "--max-complexity=20" "--max-line-length=150"))
)
