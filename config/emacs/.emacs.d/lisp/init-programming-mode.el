;; -*- lexical-binding: t -*-
(require 'init-prettify)
(require 'init-auto-complete)
(require 'init-proper-gutter-mode)
(require 'init-invisible-chars)
(require 'init-syntax-checker)
(require 'init-parenthesis)
(require 'init-compile-mode)
(require 'init-code-snippets)
(require 'init-documentation)
(require 'init-code-folding)
(require 'init-syntatic-close)
(require 'init-tags)

(define-minor-mode
  programming-mode
  :lighter " λ"
  :group 'programming

  (evil-leader/set-key "r" 'recompile)

  (setq show-paren-delay 0)

  (if programming-mode
    (progn
      (prettify-symbols-mode +1)
      (whitespace-mode +1)
      (proper-gutter-mode +1)
      (rainbow-delimiters-mode +1)
      (show-paren-mode +1)
      (yas-global-mode +1)
      (flycheck-mode +1)
      (xref-etags-mode +1)
      (company-mode +1)
      (origami-mode +1)
      (initialize-project-tags))
    (progn
      (prettify-symbols-mode -1)
      (whitespace-mode -1)
      (proper-gutter-mode -1)
      (rainbow-delimiters-mode -1)
      (show-paren-mode -1)
      (yas-global-mode -1)
      (flycheck-mode -1)
      (xref-etags-mode -1)
      (company-mode -1)
      (origami-mode -1))))

(defun set-compile-for (mode command)
  (add-hook mode
            (lambda ()
              (set (make-local-variable 'compile-command) command))))

(defun set-company-backend-for (mode backend)
  (add-hook mode
            (lambda ()
              (add-to-list 'company-backends backend))))

; Outline
(location-list-buffer (rx bos "*helm imenu*"))
(define-key evil-normal-state-map (kbd "C-S-o") 'helm-imenu)
(global-set-key (kbd "C-S-o") 'helm-imenu)

(provide 'init-programming-mode)
