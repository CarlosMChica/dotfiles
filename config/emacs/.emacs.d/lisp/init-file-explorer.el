;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'winum
;;     (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :config
;;   (progn
;;     (setq treemacs-collapse-dirs                 (if (executable-find "python") 3 0)
;;           treemacs-deferred-git-apply-delay      0.5
;;           treemacs-display-in-side-window        t
;;           treemacs-file-event-delay              5000
;;           treemacs-file-follow-delay             0.2
;;           treemacs-follow-after-init             t
;;           treemacs-git-command-pipe              ""
;;           treemacs-goto-tag-strategy             'refetch-index
;;           treemacs-indentation                   2
;;           treemacs-indentation-string            " "
;;           treemacs-is-never-other-window         nil
;;           treemacs-max-git-entries               5000
;;           treemacs-no-png-images                 nil
;;           treemacs-no-delete-other-windows       t
;;           treemacs-project-follow-cleanup        nil
;;           treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
;;           treemacs-recenter-distance             0.1
;;           treemacs-recenter-after-file-follow    nil
;;           treemacs-recenter-after-tag-follow     nil
;;           treemacs-recenter-after-project-jump   'always
;;           treemacs-recenter-after-project-expand 'on-distance
;;           treemacs-show-cursor                   t
;;           treemacs-show-hidden-files             t
;;           treemacs-silent-filewatch              nil
;;           treemacs-silent-refresh                nil
;;           treemacs-sorting                       'alphabetic-desc
;;           treemacs-space-between-root-nodes      t
;;           treemacs-tag-follow-cleanup            t
;;           treemacs-tag-follow-delay              1.5
;;           treemacs-width                         30)

;;     ;; The default width and height of the icons is 22 pixels. If you are
;;     ;; using a Hi-DPI display, uncomment this to double the icon size.
;;     ;;(treemacs-resize-icons 44)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)
;;     (treemacs-fringe-indicator-mode t)
;;     (pcase (cons (not (null (executable-find "git")))
;;                  (not (null (executable-find "python3"))))
;;       (`(t . t)
;;        (treemacs-git-mode 'deferred))
;;       (`(t . _)
;;        (treemacs-git-mode 'simple))))

;;     (evil-leader/set-key "f" 'treemacs-find-file)
;;     (global-set-key (kbd "C-n") 'treemacs)
;;     (define-key evil-normal-state-map (kbd "C-n") 'treemacs)

;;   :bind
;;   (:map global-map
;;         ("C-x t 1"   . treemacs-delete-other-windows)
;;         ("C-x t B"   . treemacs-bookmark)
;;         ("C-n"       . treemacs)
;;         ("C-x t C-t" . treemacs-find-file)
;;         ("C-x t M-t" . treemacs-find-tag)))


;; (use-package treemacs-evil
;;   :after treemacs evil
;;   :ensure t)

;; (use-package treemacs-projectile
;;   :after treemacs projectile
;;   :ensure t)

;; (use-package treemacs-icons-dired
;;   :after treemacs dired
;;   :ensure t
;;   :config (treemacs-icons-dired-mode))

;; (use-package treemacs-magit
;;   :after treemacs magit
;;   :ensure t)

(use-package
  neotree
  :ensure t
  :init
  (evil-define-key
    'normal neotree-mode-map
    (kbd "TAB") 'neotree-enter
    (kbd "RET") 'neotree-enter
    (kbd "I")   'neotree-hidden-file-toggle
    (kbd "i")   'neotree-enter-horizontal-split
    (kbd "s")   'neotree-enter-vertical-split
    (kbd "m")   'neotree-modify-mode-menu
    (kbd "p")   'neotree-open-file-in-system-application)

  (evil-leader/set-key "f" 'neotree-find)

  (global-set-key (kbd "C-n") 'neotree-toggle)
  (define-key evil-normal-state-map (kbd "C-n") 'neotree-toggle)
  (setq-default neo-show-hidden-files t)
  (setq-default neo-auto-indent-point t)
  (setq-default neo-window-fixed-size nil))

(defun neotree-modify-mode-menu (option)
  "Asks for a mode and execute associated Neotree command"
  (interactive "c(a)dd node | (d)elete node | (c)opy node | (r)ename node")
  (cond
    ((eq option ?a) (call-interactively #'neotree-create-node))
    ((eq option ?d) (neotree-delete-node))
    ((eq option ?c) (neotree-copy-node))
    ((eq option ?r) (neotree-rename-node))
    (:else (message (format "Invalid option %c" option)))))

(location-list-buffer (rx bos "*helm-mode-evil-ack-in*"))
(location-list-buffer (rx bos "*helm-mode-neotree-"))
(location-list-buffer (rx bos "*helm-mode-neo-buffer--rename-node*"))

(defun copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))

(provide 'init-file-explorer)
