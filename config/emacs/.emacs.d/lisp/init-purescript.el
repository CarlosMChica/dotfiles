(use-package
  purescript-mode
  :diminish purescript-indentation-mode
  :mode "\\.purs\\'"
  :ensure t
  :defer t
  :config
  (add-hook 'purescript-mode-hook 'programming-mode))

(provide 'init-purescript)
