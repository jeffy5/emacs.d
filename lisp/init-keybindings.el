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

;; 打开最近修改的文件
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; org-agend的快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; 代码缩进
;; (global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Hippie补全
(global-set-key (kbd "M-n") 'hippie-expand)

;; 在Dired Mode跳转目录时共用一个缓冲区 (延迟加载)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 使用<C-n/p>来选择补全项
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; 全局搜索
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; js2 mode 查找变量或函数 (o代表查找当前光标或行的变量)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "M-s o") 'occur-dwim)

;; 使用<C-w>来删除单词
(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'init-keybindings)
