;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(add-to-list 'default-frame-alist '(undecorated-round . t))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "George Sims"
      user-mail-address "george.sims.nl@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(if (eq system-type 'darwin) ; Check if the system is macOS
    (setq doom-font (font-spec :family "JetBrains Mono" :size 18 :weight 'Medium)) ; Set font size for macOS
  (setq doom-font (font-spec :family "JetBrains Mono" :size 24 :weight 'Bold))) ; Set font size for Linux

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; Packages
;; === gh-copilot
;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))


;; === lsp === src: https://geeksocket.in/posts/emacs-lsp-go/
; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; install gopls via `'go install golang.org/x/tools/gopls@latest`
;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)
;; === vterm ===
(defvar vterm-toggle--buffer-name "*vterm*")

(defun vterm-toggle ()
  "Toggle vterm buffer."
  (interactive)
  (if (get-buffer vterm-toggle--buffer-name)
      (progn
        (when (get-buffer-window vterm-toggle--buffer-name)
          (delete-window (get-buffer-window vterm-toggle--buffer-name)))
        (kill-buffer vterm-toggle--buffer-name))
    (vterm)))

;; Set the shell to zsh
(setq vterm-shell "/bin/zsh")

;; Set the initial number of rows and columns
(setq vterm-max-scrollback 10000)
(setq vterm-buffer-name-string "vterm: %s")

;; Keybindings to toggle vterm
(map! :leader
      (:prefix "t"
       :desc "Toggle vterm" "t" #'vterm-toggle))

;; === magit ===

;; Create PR via magit
(require 'magit)

(defun magit-create-pull-request-draft ()
    "Create a draft pull request using GitHub CLI."
      (interactive)
        (let* ((base-branch (magit-get-current-branch))
                        (head-branch (magit-read-other-branch "Head branch")))
              (magit-shell-command "gh pr create --draft --fill | tee /dev/tty | pbcopy")))
(define-key magit-mode-map (kbd "+") #'magit-create-pull-request-draft)

;; (defun magit-create-pull-request-regular ()
;;     "Create a regular pull request using GitHub CLI."
;;       (interactive)
;;         (let* ((base-branch (magit-get-current-branch))
;;                         (head-branch (magit-read-other-branch "Head branch")))
;;               (magit-shell-command "gh pr create --fill | tee /dev/tty | pbcopy")))

;; (define-key magit-mode-map (kbd "+") #'magit-create-pull-request-regular)


;; === org mode ===
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(after! org)
  (map! :map org-mode-map
	:n "C-j" #'org-metadown
	:n "C-k" #'org-metaup
	:n "C-h" #'org-metaleft
	:n "C-l" #'org-metaright)
  (setq org-directory "~/Documents/org"
	org-bullets-bullet-list '(""))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(setq editorconfig-mode 1)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Terraform mode
;; auto-format any files with the .tf extension. This mode will auto-enable
;; when a file with extension .tf is opened.
;; (after! terraform-mode
;;   (add-hook 'terraform-mode-hook
;;             (lambda ()
;;               (add-hook 'after-save-hook
;;                         (lambda ()
;;                           (when (eq major-mode 'terraform-mode)
;;                             (let ((formatted-content (shell-command-to-string (format "terraform fmt -write=false -diff -" buffer-file-name))))
;;                               (setq inhibit-read-only t)
;;                               (erase-buffer)
;;                               (insert formatted-content)
;;                               (setq inhibit-read-only nil))))))))

