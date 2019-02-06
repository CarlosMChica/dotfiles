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
  (set-company-backend-for 'haskell-mode-hook 'company-ghci)
  (setq projectile-tags-command "fast-tags -e -R -o %s --exclude=\"%s\" \"%s\"")

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

;  (use-package
;    dante
;    :ensure t
;    :config
;
;    (evil-leader/set-key "7" 'xref-find-references)
;    (add-hook 'dante-mode-hook
;              '(lambda () (flycheck-add-next-checker
;                      'haskell-dante
;                      '(warning . haskell-hlint)))))

  (add-hook 'haskell-mode-hook 'programming-mode)
  (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
  (add-hook 'haskell-mode-hook 'haskell/prettify)
  (add-hook 'haskell-mode-hook 'hs-doc)

  (defun hs-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Haskell"))))
;  (add-hook 'haskell-mode-hook 'intero-mode))
;  (add-hook 'haskell-mode-hook 'dante-mode))



; (location-list-buffer (rx bos "*Intero-Help*"))

(provide 'init-haskell)
