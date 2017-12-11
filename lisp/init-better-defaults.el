;;     ____            _    __              __               __     __
;;    /  _/  ____     (_)  / /_            / /_     ___     / /_   / /_   ___
;;    / /   / __ \   / /  / __/  ______   / __ \   / _ \   / __/  / __/  / _ \
;;  _/ /   / / / /  / /  / /_   /_____/  / /_/ /  /  __/  / /_   / /_   /  __/
;; /___/  /_/ /_/  /_/   \__/           /_.___/   \___/   \__/   \__/   \___/
;; 
;;                          __           ____                     __   __
;;    _____            ____/ /  ___     / __/  ____ _   __  __   / /  / /_   _____
;;   / ___/  ______   / __  /  / _ \   / /_   / __ `/  / / / /  / /  / __/  / ___/
;;  / /     /_____/  / /_/ /  /  __/  / __/  / /_/ /  / /_/ /  / /  / /_   (__  )
;; /_/               \__,_/   \___/  /_/     \__,_/   \__,_/  /_/   \__/  /____/
;; 

;; 打开init.el配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 打开最近修改的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 高亮括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; Lisp的单引号有其他意义, 所以除去单引号
;; (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; 在选中时进行输入会删除选中的文本
(delete-selection-mode 1)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 禁止生成备份文件
(setq make-backup-files nil)

;; 禁止自动保存文件
(setq auto-save-default nil)

;; 关闭警告音
(setq ring-bell-function 'ignore)

;; 提示输入时用y/n取代yes/on
(fset 'yes-or-no-p 'y-or-n-p)

;; 代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;; 缩写补全
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ;; wjh
                                            ("cwjh" "吴剑辉")
                                            ;; zhbit
                                            ("czhbit" "北京理工大学珠海学院")
					    ))

;; Hippie增强补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

;; 默认递归删除和复制文件夹
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 在Dired Mode跳转目录时共用一个缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径。
(require 'dired-x)

;; 隐藏换行符
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
    (aset buffer-display-table ?\^M []))

(provide 'init-better-defaults)
