;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Emacs 27+ deprecates use of package cl.  Should be using cl-user going forward.
;; Packages we use might use this and trigger a warning, which I can't really
;; control.  So, turning off the warning.
(setq byte-compile-warnings '(cl-functions))

;; To get a list of packages that depend on cl, run the following. I ran it and
;; it looks like it is Slime that is using it.
;; (require 'loadhist)
;; (file-dependents (feature-file 'cl))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("E" "Eisenhower view"
      ((tags-todo "+URGENT+IMPORTANT"
		  ((org-agenda-overriding-header "Urgent and Important (Do now)")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-entry-if
		      (quote scheduled))))))
       (tags-todo "-URGENT+IMPORTANT"
		  ((org-agenda-overriding-header "Not Urgent but Important (Decide when to do)")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-entry-if
		      (quote scheduled))))))
       (tags-todo "URGENT-IMPORTANT"
		  ((org-agenda-overriding-header "Urgent, but not Important (Delegate or say \"no\")")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-entry-if
		      (quote scheduled))))))
       (tags-todo "-URGENT-IMPORTANT"
		  ((org-agenda-overriding-header "Neither Urgent nor Important (Re-code or dump)")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-entry-if
		      (quote scheduled)))))))
      nil nil)
     ("i" "Inbox items" todo "TODO"
      ((org-agenda-overriding-header "Inbox TODO items")
       (org-agenda-files
	(quote
	 ("~/org/inbox.org" "~/Dropbox/org/Mobile-Inbox.org")))))
     ("d" "DONE items" todo "DONE" nil))))
 '(org-agenda-files (quote ("~/org/inbox.org" "~/org/todo.org")))
 '(org-agenda-restore-windows-after-quit t)
 '(org-capture-templates
   (quote
    (("p" "Private templates")
     ("pj" "Journal entry" entry
      (file+datetree "~/org/journal.org")
      (file "~/org/template-journal.txt"))
     ("pb" "Book for reading list" entry
      (file+headline "~/org/books.org" "Books")
      (file "~/org/template-books.txt"))
     ("pt" "TODO entry" entry
      (file+headline "~/org/inbox.org" "Inbox")
      (file "~/org/template-todo.txt")))))
 '(org-clock-into-drawer t)
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-with-section-numbers nil)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets (quote ((org-agenda-files :level . 1))))
 '(org-outline-path-complete-in-steps t)
 '(org-refile-use-outline-path t)
 '(org-startup-indented t)
 '(org-track-ordered-property-with-tag t)
 '(package-selected-packages
   (quote
    (paren-face paredit multiple-cursors iedit expand-region counsel swiper ac-js2 js2-mode magit markdown-mode which-key use-package org-bullets))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; *** All custom initialization comes here ***
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(require 'org)
(org-babel-load-file (expand-file-name "settings.org" user-emacs-directory))
