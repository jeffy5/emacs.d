;;
;;    /  _/  ____     (_)  / /_            ___     _   __   (_)  / /        ___ 
;;    / /   / __ \   / /  / __/  ______   / _ \   | | / /  / /  / /        / _ \
;;  _/ /   / / / /  / /  / /_   /_____/  /  __/   | |/ /  / /  / /   _    /  __/
;; /___/  /_/ /_/  /_/   \__/            \___/    |___/  /_/  /_/   (_)   \___/ 
;;                                                                              
;;     __
;;    / /
;;   / / 
;;  / /  
;; /_/   
;;
;; 启动evil
(global-evil-leader-mode)
(evil-mode 1)

;; 将 insert 模式中的快捷键清空
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; Evil Surround
(require 'evil-surround)
(global-evil-surround-mode)

;; Evil nerd comment
(evilnc-default-hotkeys)

(provide 'init-evil)
