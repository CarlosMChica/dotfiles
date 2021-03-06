(require 'init-programming-mode)

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
  :defer t
  :config
  (setq
    web-mode-markup-indent-offset 2
    web-mode-css-indent-offset 2)
  (add-hook 'web-mode-hook 'programming-mode))

(provide 'init-web)
