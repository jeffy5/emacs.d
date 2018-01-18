;;     ____            _    __                       _                  __
;;    /  _/  ____     (_)  / /_            __  __   (_)        ___     / /
;;    / /   / __ \   / /  / __/  ______   / / / /  / /        / _ \   / /
;;  _/ /   / / / /  / /  / /_   /_____/  / /_/ /  / /   _    /  __/  / /
;; /___/  /_/ /_/  /_/   \__/            \__,_/  /_/   (_)   \___/  /_/
;; 

;; Full screen with Emacs start
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 显示行号
(global-linum-mode 1)
;; 设置行号的格式
(setq linum-format "%d ")

;; 关闭工具栏
(tool-bar-mode -1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;; (set-face-attribute 'default nil :height 160)

;; Highlight current line
(global-hl-line-mode 1)

;; Set the theme
(load-theme 'monokai 1)

(defun on-frame-open (frame)
  (if (not (display-graphic-p frame))
      (set-face-background 'default "unspecified-bg" frame)))
(on-frame-open (selected-frame))
(add-hook 'after-make-frame-functions 'on-frame-open)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(provide 'init-ui)
