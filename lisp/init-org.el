;;     ____            _    __
;;    /  _/  ____     (_)  / /_            ____     _____   ____ _         ___
;;    / /   / __ \   / /  / __/  ______   / __ \   / ___/  / __ `/        / _ \
;;  _/ /   / / / /  / /  / /_   /_____/  / /_/ /  / /     / /_/ /   _    /  __/
;; /___/  /_/ /_/  /_/   \__/            \____/  /_/      \__, /   (_)   \___/
;;                                                       /____/
;;     __
;;    / /
;;   / /
;;  / /
;; /_/
;; 


;; Highlight the code in org-mode
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 打开 emacs 默认打开 agenda
(add-hook 'after-init-hook
          (lambda ()
            (org-agenda-list))
          t)

;; 设置 TODO 关键字
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s!/!)" "PAUSE(p!/!)" "ADDITION(a@/!)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "PROJECT(P@)" "|" "CANCELLED(c@/!)"))))

(provide 'init-org)
