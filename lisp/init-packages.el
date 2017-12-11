;;     ____            _    __                                        __
;;    /  _/  ____     (_)  / /_            ____     ____ _   _____   / /__
;;    / /   / __ \   / /  / __/  ______   / __ \   / __ `/  / ___/  / //_/
;;  _/ /   / / / /  / /  / /_   /_____/  / /_/ /  / /_/ /  / /__   / ,<
;; /___/  /_/ /_/  /_/   \__/           / .___/   \__,_/   \___/  /_/|_|
;;                                     /_/
;;                                                    __
;;   ____ _   ____ _   ___     _____         ___     / /
;;  / __ `/  / __ `/  / _ \   / ___/        / _ \   / /
;; / /_/ /  / /_/ /  /  __/  (__  )   _    /  __/  / /
;; \__,_/   \__, /   \___/  /____/   (_)   \___/  /_/
;;         /____/
;; 

;; Load the package list
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar wjh/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      popwin
		      ;; --- Global Search ---
		      helm-ag
		      ;; --- Linter ---
		      flycheck
		      ;; --- Snippet ---
		      yasnippet
		      auto-yasnippet
		      ;; --- Major Mode ---
		      web-mode
		      js2-mode
		      evil
		      ;; --- Minor Mode ---
		      js2-refactor
		      nodejs-repl
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;; solarized-theme
		      ) "Default packages")

(setq package-selected-packages wjh/packages)

(defun wjh/packages-installed-p ()
  (loop for pkg in wjh/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (wjh/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg wjh/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'init-packages)
