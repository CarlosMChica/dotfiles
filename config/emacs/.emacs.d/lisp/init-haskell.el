(require 'init-programming-mode)

(defun haskell/prettify ()
  (prettify
    '(
      ("forall" . ?∀)
      ("exists" . ?∃)

      ("->" . ?→)
      ("<-" . ?←)
      ("=>" . ?⇒)

      ("|->" . ?↦)
      ("<-|" . ?↤)

      ("~>" . ?⇝)
      ("<~" . ?⇜)

      (">->" . ?↣)
      ("<-<" . ?↢)

      ("not" . ?¬)
      ("&&" . ?∧)
      ("||" . ?∨)

      ("==" . ?≡)
      ("/=" . ?≠)
      ("<=" . ?≤)
      (">=" . ?≥)

      ("elem" . ?∈)
      ("notElem" . ?∉)
      ("member" . ?∈)
      ("notMember" . ?∉)
      ("union" . ?∪)
      ("intersection" . ?∩)
      ("isSubsetOf" . ?⊆)
      ("isProperSubsetOf" . ?⊂)

      ("<<" . ?≪)
      (">>" . ?≫)
      ("undefined" . ?⊥)
      ("\\" . ?λ))))

(use-package ormolu
 :hook (haskell-mode . ormolu-format-on-save-mode)
 :ensure t
 :mode "\\.hs$"
 :defer t
 :after (reformatter haskell-mode)
 :bind
 (:map haskell-mode-map
  ("C-c r" . ormolu-format-buffer))
 )

(use-package
  haskell-mode
  :ensure t
  :mode "\\.hs$"
  :defer t
  :config
;  (use-package
;    intero
;    :ensure t
;    :config
;    (flycheck-add-next-checker 'intero '(warning . haskell-hlint))
;    (global-set-key (kbd "C-g") 'intero-goto-definition)
;    (global-set-key (kbd "M-n") 'intero-highlight-uses-mode-next)
;    (global-set-key (kbd "M-p") 'intero-highlight-uses-mode-prev)
;    (global-set-key (kbd "ESC <f7>") 'intero-uses-at))

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
  (add-hook 'haskell-mode-hook 'haskell/prettify)
  (add-hook 'haskell-mode-hook 'hs-doc)
  ;; (add-hook 'haskell-mode-hook 'ormolu-format-on-save-mode)

  (defun hs-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Haskell"))))

(my/highlight-keyword-in-mode 'haskell-mode "error" nil 'font-lock-warning-face)
(my/highlight-keyword-in-mode 'haskell-mode "undefined" nil 'font-lock-warning-face)

;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-to-list 'eglot-server-programs '(haskell-mode . ( "/home/carlos/repositories/habito/.ghcide" "--lsp"))))

(use-package lsp-mode
  :ensure t
  :hook (haskell-mode . lsp)
  :commands lsp
  :config
  (setq lsp-enable-file-watchers nil)
  (setq lsp-log-io t)
  (setq lsp-enable-xref t)
  (setq lsp-enable-imenu t)
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-render-documentation t)
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
  (setq sp-ui-sideline-update-mode 'point))

(use-package lsp-haskell
 :ensure t
 :config
 (setq lsp-haskell-process-path-hie "ghcide")
 (setq lsp-haskell-process-args-hie '())
 ;; Comment/uncomment this line to see interactions between lsp client/server.
 (setq lsp-log-io t)
 ;; (setq lsp-auto-guess-root nil)
 )

(provide 'init-haskell)
