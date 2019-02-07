(use-package
  magit
  :ensure t
  :defer t)

(evil-leader/set-key "g" 'magit-status)

(provide 'init-git)
