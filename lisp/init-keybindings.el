;;     ____            _    __              __                       __       _
;;    /  _/  ____     (_)  / /_            / /__   ___     __  __   / /_     (_)
;;    / /   / __ \   / /  / __/  ______   / //_/  / _ \   / / / /  / __ \   / /
;;  _/ /   / / / /  / /  / /_   /_____/  / ,<    /  __/  / /_/ /  / /_/ /  / /
;; /___/  /_/ /_/  /_/   \__/           /_/|_|   \___/   \__, /  /_.___/  /_/
;;                                                      /____/
;;                  __   _                                            __
;;    ____     ____/ /  (_)  ____     ____ _   _____         ___     / /
;;   / __ \   / __  /  / /  / __ \   / __ `/  / ___/        / _ \   / /
;;  / / / /  / /_/ /  / /  / / / /  / /_/ /  (__  )   _    /  __/  / /
;; /_/ /_/   \__,_/  /_/  /_/ /_/   \__, /  /____/   (_)   \___/  /_/
;; 

;; 代码缩进
;; (global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径。
;; 在Dired Mode跳转目录时共用一个缓冲区 (延迟加载)
(require 'dired-x)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 快速打开文件
(projectile-mode)

;; Hippie增强补全
(global-set-key (kbd "M-n") 'hippie-expand)

;; 使用<C-n/p>来选择补全项
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; JS2 Mode
;; 
;; 查找变量或函数 (o代表查找当前光标或行的变量)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "M-s o") 'occur-dwim)
;; 代码重构
(js2r-add-keybindings-with-prefix "C-c C-m")

;; Org Mode
;;
;; org-agend的快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)

;; 使用<C-w>来删除单词
(global-set-key (kbd "C-w") 'backward-kill-word)

;; Python
;;
;; 扩展 for 语句
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; Evil
;;
(custom-set-variables '(evil-leader/leader "SPC"))
(evil-leader/set-key
 "ff" 'find-file
 "fs" 'find-file-in-project
 "fr" 'recentf-open-files
 "fd" 'dired-jump
 "bb" 'switch-to-buffer
 "bl" 'list-buffers
 "j" 'ace-jump-word-mode
 "0"  'select-window-0
 "1"  'select-window-1
 "2"  'select-window-2
 "3"  'select-window-3
 "wv" 'split-window-right
 "wh" 'split-window-below
 "wo" 'delete-other-windows
 "<SPC>"  'counsel-M-x
 "cc" 'evilnc-comment-or-uncomment-lines
 "gs" 'helm-do-ag-project-root
 "n" 'mc/mark-next-like-this
 "x" 'mc/skip-to-next-like-this
 )

;; 设置 C-c 回到 normal mode
(define-key evil-insert-state-map (kbd "C-c") 'evil-force-normal-state)

;; 取消 nerd comment `, ,` 的按键绑定
(setq evilnc-hotkey-comment-operator "\\")

;; <C-u> 往上滚
(global-set-key (kbd "C-u") 'scroll-down-command)

(provide 'init-keybindings)
