;; 启动evil
(evil-mode 1)

;; 将 insert state map 中的快捷键清空
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(provide 'init-evil)
