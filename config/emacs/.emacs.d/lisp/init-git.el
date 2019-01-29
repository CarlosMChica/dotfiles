(use-package
  magit
  :ensure t
  :defer t
  :config
  (evil-leader/set-key "g" 'magit-status))

(provide 'init-git)
