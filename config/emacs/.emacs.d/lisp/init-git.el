(use-package
  magit
  :ensure t
  :defer t
  :config
  (evil-leader/set-key "gst" 'magit-status))

(provide 'init-git)
