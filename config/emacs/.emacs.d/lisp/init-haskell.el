(require 'init-programming-mode)

(use-package
  haskell-mode
  :ensure t
  :mode "\\.hs$"
  :defer t
  :config
  (use-package company-ghci :ensure t)

  (custom-set-variables '(haskell-stylish-on-save nil))
  (set-compile-for 'haskell-mode-hook "stack test")
  ;(set-company-backend-for 'haskell-mode-hook 'company-ghci)
  (setq projectile-tags-command "fast-tags -e -R -o %s --exclude=\"%s\" \"%s\"")
  (setq haskell-align-imports-pad-after-name t)

  (add-hook 'align-load-hook (lambda ()
  (add-to-list 'align-rules-list
               '(haskell-types
                 (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-assignment
                 (regexp . "\\(\\s-+\\)=\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-arrows
                 (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-left-arrows
                 (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))))

  (add-hook
   'flycheck-mode-hook
   (lambda () (progn
           (add-to-list 'flycheck-disabled-checkers 'haskell-ghc)
           (add-to-list 'flycheck-disabled-checkers 'haskell-stack-ghc))))

  (add-hook 'haskell-mode-hook 'programming-mode)
  (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
  ;;(add-hook 'haskell-mode-hook 'haskell/prettify)
  (add-hook 'haskell-mode-hook 'hs-doc)

  (defun hs-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Haskell"))))

(my/highlight-keyword-in-mode 'haskell-mode "error" nil 'font-lock-warning-face)
(my/highlight-keyword-in-mode 'haskell-mode "undefined" nil 'font-lock-warning-face)

(use-package lsp-mode
  :ensure t
  :hook (haskell-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :hook ((before-save . lsp-format-buffer))
  :config
  (setq lsp-enable-file-watchers nil)
  (setq lsp-log-io t)
  (setq lsp-enable-xref t)
  (setq lsp-enable-imenu t)
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-render-documentation t)
  )

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-show-symbol nil)
  (setq lsp-ui-sideline-update-mode 'point))

(use-package lsp-haskell
 :ensure t
 :config
 (add-hook 'haskell-mode-hook #'lsp)
 (add-hook 'haskell-literate-mode-hook #'lsp)
 ;;(setq lsp-haskell-server-path "ghcide")
 ;;(setq lsp-haskell-server-args '())
 ;; Comment/uncomment this line to see interactions between lsp client/server.
 (setq lsp-log-io t)
 ;; (setq lsp-auto-guess-root nil)
 )

(provide 'init-haskell)
