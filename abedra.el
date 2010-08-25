(color-theme-blackboard)
(require 'smex)
(require 'android-mode)
(require 'elein)

(eval-after-load "abedra.el" '(smex-initialize))
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'smex-update-and-run)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

