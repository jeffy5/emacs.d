;; 代码块补全
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; 代码块补全快捷键
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

(provide 'init-snippet)
