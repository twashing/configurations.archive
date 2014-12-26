;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; Multiple Cursors
(require 'multiple-cursors)


;; CIDER setup: from: https://github.com/clojure-emacs/cider
;; disable auto-selection of the error buffer when it's displayed
(setq cider-auto-select-error-buffer nil)
(setq cider-repl-result-prefix "")
(global-company-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(defun cider-repl-reset ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(reset)")
    (cider-repl-return)))

(global-set-key (kbd "C-c r") 'cider-repl-reset)

(defun cider-project-refresh ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(reload-project)")
    (cider-repl-return)))

(global-set-key (kbd "C-c M-r") 'cider-project-refresh)


;; Kill Other Buffers
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))

;; Remove Funny Chars: taken from cemerick's gist: https://gist.github.com/cemerick/6865761
(add-hook 'clojure-mode-hook
          (lambda ()
            (font-lock-remove-keywords
             nil `(("(\\(fn\\)[\[[:space:]]"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "λ")
                              nil)))
                   ("\\(#\\)("
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "ƒ")
                              nil)))
                   ("\\(#\\){"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "∈")
                              nil)))))))

(add-to-list 'exec-path "/home/twashing/bin")

; Copy Line: taken from http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html
(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When `universal-argument' is called first, copy whole buffer (but respect `narrow-to-region')."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-end-position)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-ring-save p1 p2)))

; ; Cut Line
(defun xah-cut-line-or-region ()
  "Cut current line, or text selection.
When `universal-argument' is called first, cut whole buffer (but respect `narrow-to-region')."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-beginning-position 2)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-region p1 p2)))

(global-set-key (kbd "<f2>") 'xah-cut-line-or-region) ; cut
(global-set-key (kbd "<f3>") 'xah-copy-line-or-region) ; copy
(global-set-key (kbd "<f4>") 'yank) ; paste


;; Tabbing setup
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Tabbing for Java
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode t)))

;; Delete File and Buffer (http://emacsredux.com/blog/2013/04/03/delete-file-and-buffer/)
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(global-set-key (kbd "C-c D")  'delete-file-and-buffer)
(global-set-key (kbd "C-q")  'move-beginning-of-line)


;; Highlight current line (http://emacsredux.com/blog/2013/04/02/highlight-current-line/)
(global-hl-line-mode 1)
(hl-line-mode +1)


;; Open a line under the current one
(defun smart-open-line ()
  "Insert an empty line after the current line.
  Position the cursor at its beginning, according to the current mode."
    (interactive)
    (move-end-of-line nil)
    (newline-and-indent))

(global-set-key [(shift return)] 'smart-open-line)


;; try to make datomic schemas have Major mode of Clojure
(add-to-list 'auto-mode-alist '("\\.dtm\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

(windmove-default-keybindings 'meta)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
