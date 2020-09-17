(use-package
  highlight-indent-guides
  :ensure t
  :defer t
  :config
  (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-responsive 'top))

(provide 'init-indentation)
