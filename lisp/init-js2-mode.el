;;     ____            _    __                _            ___
;;    /  _/  ____     (_)  / /_              (_)  _____   |__ \    ____ ___
;;    / /   / __ \   / /  / __/  ______     / /  / ___/   __/ /   / __ `__ \
;;  _/ /   / / / /  / /  / /_   /_____/    / /  (__  )   / __/   / / / / / /
;; /___/  /_/ /_/  /_/   \__/           __/ /  /____/   /____/  /_/ /_/ /_/
;;                                     /___/
;;                 __                         __
;;   ____     ____/ /  ___           ___     / /
;;  / __ \   / __  /  / _ \         / _ \   / /
;; / /_/ /  / /_/ /  /  __/   _    /  __/  / /
;; \____/   \__,_/   \___/   (_)   \___/  /_/
;; 

;; Load major mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; 设置web mode的缩进大小配置
(defun wjh-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'wjh-web-mode-indent-setup)

;; 为js2mode 添加钩子 js2-refactore-mode(Minor Mode)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; 搜索被选中的或光标下的字符串
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
          (buffer-substring-no-properties
            (region-beginning)
            (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))


;; imenu 可以显示当前所有缓冲区的列表，下面的配置可以让其拥有更精确的跳转，
(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                               ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                               ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
          (lambda ()
            (setq imenu-create-index-function 'js2-imenu-make-index)))

;; 调用Eslint语法检查
(add-hook 'js2-mode-hook 'flycheck-mode)

(provide 'init-js2-mode)
