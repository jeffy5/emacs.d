(elpy-enable)

(require 'elpy)

;; 使用 jedi补全
(setq elpy-rpc-backend "jedi")

;; 默认使用 Python3
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq pyvenv-virtualenvwrapper-python "/usr/bin/python3")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(provide 'init-elpy)
