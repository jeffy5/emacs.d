;;     ____            _    __                                                
;;    /  _/  ____     (_)  / /_            _____   ____ ___     ____ _   _____
;;    / /   / __ \   / /  / __/  ______   / ___/  / __ `__ \   / __ `/  / ___/
;;  _/ /   / / / /  / /  / /_   /_____/  (__  )  / / / / / /  / /_/ /  / /    
;; /___/  /_/ /_/  /_/   \__/           /____/  /_/ /_/ /_/   \__,_/  /_/     
;;                                                                            
;;    __                                                                      __
;;   / /_   ____     ____ _   _____   ___     ____     _____         ___     / /
;;  / __/  / __ \   / __ `/  / ___/  / _ \   / __ \   / ___/        / _ \   / / 
;; / /_   / /_/ /  / /_/ /  / /     /  __/  / / / /  (__  )   _    /  __/  / /  
;; \__/  / .___/   \__,_/  /_/      \___/  /_/ /_/  /____/   (_)   \___/  /_/   
;;      /_/  
;;
;; 加载 smartparens
(require 'smartparens-config)

;; 高亮括号匹配
(add-hook 'prog-mode-hook 'show-paren-mode)

;; 在所有编程语言的模式中启动smartparens mode
(add-hook 'prog-mode-hook #'smartparens-mode)
;; Lisp的单引号有其他意义, 所以除去单引号
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

(provide 'init-smartparens)
