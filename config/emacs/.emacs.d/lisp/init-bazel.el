(require 'init-programming-mode)

(use-package
  bazel
  :ensure t
  :defer t
  :mode ("\\.ba?ze?l$" . bazel-mode)
  :config
  (add-hook 'bazel-mode-hook 'programming-mode)
)

(provide 'init-bazel)
