(defun initialize-project-tags ()
  (setq my-tags-current-project (concat (projectile-project-root) "TAGS"))
  (if (file-exists-p my-tags-current-project)
      (visit-tags-table my-tags-current-project)))

(use-package helm-xref
  :ensure t
  :init (setq xref-show-xrefs-function 'helm-xref-show-xrefs)
  :config
  (set-face-foreground 'helm-xref-file-name "#81A1C1")
  (setq helm-xref-candidate-formatting-function  'helm-xref-format-candidate-long))

(global-set-key (kbd "M-.") 'xref-find-definitions)
(define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
(global-set-key (kbd "M-?") 'xref-find-references)
(define-key evil-normal-state-map (kbd "M-?") 'xref-find-references)
(global-set-key (kbd "M-,") 'xref-pop-marker-stack)
(define-key evil-normal-state-map (kbd "M-,") 'xref-pop-marker-stack)

(location-list-buffer (rx bos "*helm-xref*"))
(location-list-buffer (rx bos "*helm-mode-xref*"))
(location-list-buffer (rx bos "*xref*"))
(provide 'init-tags)
