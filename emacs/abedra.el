(setq inferior-lisp-program "script/repl")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COLOR THEME
(color-theme-blackboard)
;; END COLOR THEME

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LINE NUMBERS
(require 'linum)
(global-linum-mode)
;; END LINE NUMBERS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LEININGEN MODE
(require 'elein)
;; END LEININGEN MODE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ANDROID MODE 
(require 'android-mode)
;; END ANDROID MODE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG MODE
;;; I use org-mode straight from the git repo. You need org-mode 6.3 or
;;; higher if you want to use MobileOrg and it doesn't ship with
;;; emacs.
(setq load-path (cons "~/src/opensource/org-mode/lisp" load-path))
(setq load-path (cons "~/src/opensource/org-mode/contrib/lisp" load-path))
(require 'org-install)
(setq org-directory "~/notes/days")
(setq org-mobile-files (quote ("~/notes/days")))
(setq org-mobile-inbox-for-pull "~/notes/days/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; END ORG MODE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SMEX
(require 'smex)
(eval-after-load "init.el" '(smex-initialize))
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'smex-update-and-run)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; END SMEX

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG MODE HOOKS
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq daypage-path "~/notes/days/")

(defun find-daypage (&optional date)
  "Go to the day page for the specified date, 
   or toady's if none is specified."
  (interactive (list 
                (org-read-date "" 'totime nil nil
                               (current-time) "")))
  (setq date (or date (current-time)))
  (find-file 
       (expand-file-name 
        (concat daypage-path 
        (format-time-string "%Y-%m-%d" date) ".org")))
  (when (eq 0 (buffer-size))
        ;; Insert an initial for the page
        (insert (concat "* <" 
                        (format-time-string "%Y-%m-%d %a" date) 
                        "> Notes\n\n")
        (beginning-of-buffer)
        (next-line 2))))

(defun todays-daypage ()
  "Go straight to today's day page without prompting for a date."
  (interactive) 
  (find-daypage))

(global-set-key [f4] 'todays-daypage)
(global-set-key [f5] 'find-daypage)
;; END ORG MODE HOOKS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLOJURE TWEAKS
(defun tweak-clojure-indenting ()
  (define-clojure-indent
    (assert 1)
    (def 1)
    (testing 1)
    (describe 1)
    (describe-function 1)
    (for-these 1)
    (it 1)
    (testing-fn 1)))
(add-hook 'clojure-mode-hook 'tweak-clojure-indenting)
(global-set-key [f1] 'slime-describe-symbol)
(global-set-key [(meta f1)] 'swank-clojure-javadoc)
;; END CLOJURE TWEAKS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEYBINDING TWEAKS
(define-key osx-key-mode-map (kbd "A-o") 'find-file)
(tabbar-mode -1)
;; END KEYBINDING TWEAKS
