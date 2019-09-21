(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (unless (display-graphic-p)
    (use-package
      evil-terminal-cursor-changer
      :ensure t
      :init
      (setq
        evil-motion-state-cursor 'box
        evil-visual-state-cursor 'box
        evil-normal-state-cursor 'box
        evil-insert-state-cursor 'bar
        evil-emacs-state-cursor  'hbar)
      :config
      (evil-terminal-cursor-changer-activate)))

  (define-key evil-motion-state-map (kbd "C-z") 'suspend-emacs)

  ;; Enable arrows
  (defun enable-arrow-keys ()
    (interactive)
    (defun use-arrow-key (arrow action)
      (define-key evil-insert-state-map (kbd arrow) action)
      (define-key evil-motion-state-map (kbd arrow) action))
    (use-arrow-key "<up>" 'evil-previous-visual-line)
    (use-arrow-key "<left>" 'evil-backward-char)
    (use-arrow-key "<right>" 'evil-forward-char)
    (use-arrow-key "<down>" 'evil-next-visual-line)
    (message (format "Arrow keys enabled")))

  ;; Disable arrows
  (defun disable-arrow-keys ()
    (interactive)
    (defun disable-arrow-key (arrow)
      (defun use-vim-keys()
        (interactive)
        (message (format "Use Vim motion keys")))
      (define-key evil-insert-state-map (kbd arrow) 'use-vim-keys)
      (define-key evil-motion-state-map (kbd arrow) 'use-vim-keys))
    (disable-arrow-key "<up>")
    (disable-arrow-key "<left>")
    (disable-arrow-key "<right>")
    (disable-arrow-key "<down>")
    (message (format "Arrow keys disabled")))

  (disable-arrow-keys)

  ;; Visual line navigation
  (define-key evil-motion-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "k") 'evil-previous-visual-line)

  ;; Window navigation
  (define-key evil-motion-state-map (kbd "C-w <up>") 'evil-window-up)
  (define-key evil-motion-state-map (kbd "C-w <down>") 'evil-window-down)
  (define-key evil-motion-state-map (kbd "C-w <left>") 'evil-window-left)
  (define-key evil-motion-state-map (kbd "C-w <right>") 'evil-window-right)
  (define-key evil-motion-state-map (kbd "C-w k") 'evil-window-up)
  (define-key evil-motion-state-map (kbd "C-w j") 'evil-window-down)
  (define-key evil-motion-state-map (kbd "C-w h") 'evil-window-left)
  (define-key evil-motion-state-map (kbd "C-w l") 'evil-window-right)
  (define-key evil-motion-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-motion-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-motion-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-motion-state-map (kbd "C-l") 'evil-window-right)

  ;;Maximise window
  (define-key evil-motion-state-map (kbd "C-w f") 'maximize-window)
  (define-key evil-motion-state-map (kbd "C-f") 'maximize-window)

  ;; Buffer navigation
  (define-key evil-motion-state-map (kbd "[ b") 'evil-prev-buffer)
  (define-key evil-motion-state-map (kbd "] b") 'evil-next-buffer)

  ;;; esc quits
  (defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  ;; Reload config
  (evil-ex-define-cmd
   "ReloadConfig"
   '(lambda () (interactive) (load-file (concat emacs-dir "init.el"))))

  (evil-ex-define-cmd "od" 'kill-other-buffers)

  ;; More vim like
  (customize-set-variable 'evil-want-Y-yank-to-eol t)
  (customize-set-variable 'evil-want-C-d-scroll t)
  (customize-set-variable 'evil-want-C-u-scroll t)
  (define-key evil-normal-state-map (kbd "C-g") 'evil-show-file-info)

  ;; Typo avoider
  (evil-ex-define-cmd "WQ" "wq")
  (evil-ex-define-cmd "Wq" "wq")
  (evil-ex-define-cmd "wqa" "xall")
  (evil-ex-define-cmd "Wqa" "xall")
  (evil-ex-define-cmd "WQa" "xall")
  (evil-ex-define-cmd "WQA" "xall")
  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "Wa" 'evil-write-all)
  (evil-ex-define-cmd "WA" 'evil-write-all)
  (evil-ex-define-cmd "Q" "q")
  (evil-ex-define-cmd "Qa" "qa")
  (evil-ex-define-cmd "E" "e")
  (evil-ex-define-cmd "Vs" "vs")
  (evil-ex-define-cmd "Sp" "sp"))

  (location-list-buffer (rx bos "*evil-registers*"))

(use-package
  evil-easymotion
  :ensure t
  :config
  (evilem-default-keybindings "SPC")
  (evilem-define (kbd "SPC <up>") #'evilem-motion-previous-line)
  (evilem-define (kbd "SPC <down>") #'evilem-motion-next-line)

  (evilem-define (kbd "SPC g <up>") #'evilem-motion-previous-visual-line)
  (evilem-define (kbd "SPC g <down>") #'evilem-motion-next-visual-line))

(use-package
  evil-surround
  :ensure t
  :config
  (global-evil-surround-mode))

(use-package
  evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-key "a" 'align)
  (evil-leader/set-leader ","))

(use-package
  evil-numbers
  :ensure t
  :config

  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt))

(use-package
  evil-collection
  :ensure t
  :defer t
  :config
  (evil-collection-init))

;; search
(use-package
  evil-search-highlight-persist
  :ensure t
  :config

  (define-key evil-normal-state-map (kbd "C-S-L") 'clear-search-highlight)
  (evil-ex-define-cmd "noh" 'clear-search-highlight)
  (set-face-attribute 'evil-search-highlight-persist-highlight-face nil
                      :inherit 'evil-ex-search
                      :background nil
                      :foreground nil)
  (global-evil-search-highlight-persist t))

(defun clear-search-highlight ()
  (interactive)
  (progn
    (evil-ex-nohighlight)
    (evil-search-highlight-persist-remove-all)))

(define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)
(define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
        (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(provide '03-init-vim-mode)
