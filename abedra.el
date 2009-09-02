(color-theme-twilight)
(clojure-slime-config "/home/abedra/src/opensource")
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)

(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper o)] 'find-file)
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper right)] 'other-frame)
(global-set-key [(hyper left)] 'other-frame)
(global-set-key [(hyper w)] (lambda () (interactive) (kill-buffer (current-buffer))))

(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [(hyper +)] 'fullscreen)

