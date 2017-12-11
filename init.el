;;
;;    /  _/  ____     (_)  / /_         ___     / /
;;    / /   / __ \   / /  / __/        / _ \   / /
;;  _/ /   / / / /  / /  / /_    _    /  __/  / /
;; /___/  /_/ /_/  /_/   \__/   (_)   \___/  /_/
;; 

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; ---------------------
(require 'init-packages)

(require 'init-company)
(require 'init-popwin)

(require 'init-ui)
(require 'init-better-defaults)

(require 'init-org)
(require 'init-js2-mode)
(require 'init-evil)

(require 'init-keybindings)
