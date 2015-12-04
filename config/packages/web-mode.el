(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . web-mode))

;;; インデント数
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
  (setq indent-tabs-mode t)
  (setq tab-width 2))
(add-hook 'web-mode-hook 'web-mode-hook)
