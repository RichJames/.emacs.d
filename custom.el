(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands
   '(("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("E" "Eisenhower view"
      ((tags-todo "+URGENT+IMPORTANT"
                  ((org-agenda-overriding-header "Urgent and Important (Do now)")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled))))
       (tags-todo "-URGENT+IMPORTANT"
                  ((org-agenda-overriding-header "Not Urgent but Important (Decide when to do)")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled))))
       (tags-todo "URGENT-IMPORTANT"
                  ((org-agenda-overriding-header "Urgent, but not Important (Delegate or say \"no\")")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled))))
       (tags-todo "-URGENT-IMPORTANT"
                  ((org-agenda-overriding-header "Neither Urgent nor Important (Re-code or dump)")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'scheduled)))))
      nil nil)
     ("i" "Inbox items" todo "TODO"
      ((org-agenda-overriding-header "Inbox TODO items")
       (org-agenda-files
        '("~/org/inbox.org" "~/Dropbox/org/Mobile-Inbox.org"))))
     ("d" "DONE items" todo "DONE" nil)))
 '(org-agenda-files '("~/org/inbox.org" "~/org/todo.org"))
 '(org-agenda-restore-windows-after-quit t)
 '(org-capture-templates
   '(("p" "Private templates")
     ("pj" "Journal entry" entry
      (file+datetree "~/org/journal.org")
      (file "~/org/template-journal.txt"))
     ("pb" "Book for reading list" entry
      (file+headline "~/org/books.org" "Books")
      (file "~/org/template-books.txt"))
     ("pt" "TODO entry" entry
      (file+headline "~/org/inbox.org" "Inbox")
      (file "~/org/template-todo.txt"))))
 '(org-clock-into-drawer t)
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-with-section-numbers nil)
 '(org-log-done 'time)
 '(org-log-into-drawer t)
 '(org-outline-path-complete-in-steps t)
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-targets '((org-agenda-files :level . 1)))
 '(org-refile-use-outline-path t)
 '(org-startup-indented t)
 '(org-track-ordered-property-with-tag t)
 '(package-selected-packages
   '(deft paren-face paredit multiple-cursors iedit expand-region counsel swiper ac-js2 js2-mode magit markdown-mode which-key use-package org-bullets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
