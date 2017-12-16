;;     ____            _    __
;;    /  _/  ____     (_)  / /_            _____   ____     ____ ___     ____
;;    / /   / __ \   / /  / __/  ______   / ___/  / __ \   / __ `__ \   / __ \
;;  _/ /   / / / /  / /  / /_   /_____/  / /__   / /_/ /  / / / / / /  / /_/ /
;; /___/  /_/ /_/  /_/   \__/            \___/   \____/  /_/ /_/ /_/  / .___/
;;                                                                   /_/
;;                                             __
;;   ____ _   ____     __  __         ___     / /
;;  / __ `/  / __ \   / / / /        / _ \   / /
;; / /_/ /  / / / /  / /_/ /   _    /  __/  / /
;; \__,_/  /_/ /_/   \__, /   (_)   \___/  /_/
;;                  /____/
;; 


;; Open Company
(global-company-mode 1)

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

;; 缩写补全
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ;; wjh
                                            ("cwjh" "吴剑辉")
                                            ;; zhbit
                                            ("czhbit" "北京理工大学珠海学院")
                                            ;; vsplit
                                            ("vsp" "vsplit")
					    ))

(provide 'init-completion)
