(use-package
  web-mode
  :mode "\\.phtml\\'"
  :mode "\\.tpl\\.php\\'"
  :mode "\\.[agj]sp\\'"
  :mode "\\.as[cp]x\\'"
  :mode "\\.erb\\'"
  :mode "\\.mustache\\'"
  :mode "\\.djhtml\\'"
  :mode "\\.html\\'"
  :mode "\\.scss\\'"
  :mode "\\.css\\'"
  :ensure t
  :defer t)

(provide 'init-web)
