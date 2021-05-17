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

;; Set org agenda files.
(setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))

;; Set refile targets.
(setq org-refile-targets (mapcar #'(lambda(filename)
                                     (cons filename (cons :maxlevel 4)))
                                 org-agenda-files))

;; Config refile. 
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-use-outline-path 'full-file-path)

;; Set TODO keywords.
(setq org-todo-keywords
    '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!/!)" "CANCEL(c@/!)")
    (sequence "RESEARCH(r!/!)" "PRODUCT(p!/!)" "DEVELOP(d!/!)" "TEST(T!/!)" "|" "RELEASED(r@/!)" "CANCELED(c@/!)")))

;; Set tags.
(setq org-tag-alist '((:startgroup . nil)
                      ("@home" . ?h) ("@company" . ?w)
                      (:endgroup)

                      ;; Project related.
                      (:startgrouptag)
                      ("project")
                      (:grouptags)
                      ("product" . ?P) ("design" . ?D)
                      (:endgrouptag)

                      ;; Develop related.
                      (:startgrouptag)
                      ("develop")
                      (:grouptags)
                      ("frontend" . ?f) ("backend" . ?b) ("hardware" . ?H)
                      (:endgrouptag)

                      ;; Business related.
                      (:startgrouptag)
                      ("business")
                      (:grouptags)
                      ("discovery" . ?D) ("market" . ?m) ("interaction" . ?i)
                      (:endgrouptag)

                      ("operation" . ?o) ("review" . ?r)))

;; Set capture templates.
(setq org-capture-templates
      '(("r" "Reminder" entry (file+headline "~/org/reminder.org" "Reminder")
         "* TODO %?\n  %i\n")
        ("i" "Idea" entry (file+headline "~/org/idea.org" "Idea")
         "* %?\nMarked on %U\n  %i\n  %a")))

;; Set default columns.
(setq org-columns-default-format "%TODO(TODO) %ITEM(Task) %TAGS(Tags) %CLOCKSUM(Clock) %CLOCKSUM_T(Clock today) %Effort(Effort){:}")

;; Set global properties.
(setq org-global-properties '(("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))

;; Set export backends.
(setq org-export-backends '(ascii html icalendar latex md))

;; Set log drawer.
(setq org-log-into-drawer "LOGS")

;; Set org modules.
(setq org-modules '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))

(provide 'init-org)
