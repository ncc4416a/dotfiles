;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/06_modeline.el
;;
;;                       Last Modified: 2014-01-14 13:15:38
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ベース
;; based from: http://amitp.blogspot.jp/2011/08/emacs-custom-mode-line.html
;; Mode line setup
;(setq-default
; mode-line-position
; '(
;   " "
;   ;; Position, including warning for 80 columns
;   (:propertize "%4l" face mode-line-position-face)
;   (:propertize "/" face mode-line-delim-face-1)
;   (:eval
;    (number-to-string (count-lines (point-min) (point-max))))
;   " "
;   (:eval (propertize "%3c" 'face
;                      (if (>= (current-column) 80)
;                          'mode-line-80col-face
;                        'mode-line-position-face)))
;   " "
;   ))
;
;(setq-default
; mode-line-format
; '("%e"
;   mode-line-mule-info
;   ;; emacsclient [default -- keep?]
;   mode-line-client
;   mode-line-remote
;   ;evil-mode-line-tag
;   mode-line-position
;   ; read-only or modified status
;   (:eval
;    (cond (buffer-read-only
;           (propertize " RO " 'face 'mode-line-read-only-face))
;          ((buffer-modified-p)
;           (propertize " ** " 'face 'mode-line-modified-face))
;          (t " ")))
;   " "
;   ;; directory and buffer/file name
;   (:propertize (:eval (shorten-directory default-directory 30))
;                face mode-line-folder-face)
;   (:propertize "%b" face mode-line-filename-face)
;   ;; narrow [default -- keep?]
;   " %n"
;   ;; mode indicators: vc, recursive edit, major mode, minor modes, process, global
;   (vc-mode vc-mode)
;   " %["
;   (:propertize mode-name
;                face mode-line-mode-face)
;   "%]"
;   (:eval (propertize (format-mode-line minor-mode-alist)
;                      'face 'mode-line-minor-mode-face))
;   " "
;   (:propertize mode-line-process
;                face mode-line-process-face)
;   " "
;   (global-mode-string global-mode-string)
;   ;; " "
;   ;; nyan-mode uses nyan cat as an alternative to %p
;   ;; (:eval (when nyan-mode (list (nyan-create))))
;   ))
;
;;; Helper function
;(defun shorten-directory (dir max-length)
;  "Show up to `max-length' characters of a directory name `dir'."
;  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
;        (output ""))
;    (when (and path (equal "" (car path)))
;      (setq path (cdr path)))
;    (while (and path (< (length output) (- max-length 4)))
;      (setq output (concat (car path) "/" output))
;      (setq path (cdr path)))
;    (when path
;      (setq output (concat ".../" output)))
;    output))
;
;(set-face-attribute 'mode-line nil
;    :foreground "gray80" :background "gray10"
;    :inverse-video nil
;    :weight 'normal
;    :height 120
;    :box '(:line-width 2 :color "gray10" :style nil))
;(set-face-attribute 'mode-line-inactive nil
;    :foreground "gray80" :background "gray30"
;    :inverse-video nil
;    :weight 'extra-light
;    :height 120
;    :box '(:line-width 2 :color "gray30" :style nil))
;
;;; Extra mode line faces
;(make-face 'mode-line-read-only-face)
;(make-face 'mode-line-modified-face)
;(make-face 'mode-line-folder-face)
;(make-face 'mode-line-filename-face)
;(make-face 'mode-line-position-face)
;(make-face 'mode-line-mode-face)
;(make-face 'mode-line-minor-mode-face)
;(make-face 'mode-line-process-face)
;(make-face 'mode-line-80col-face)
;(make-face 'mode-line-delim-face-1)
;
;(set-face-attribute 'mode-line-read-only-face nil
;    :inherit 'mode-line-face
;    :foreground "#4271ae"
;    :box '(:line-width 2 :color "#4271ae"))
;(set-face-attribute 'mode-line-modified-face nil
;    :inherit 'mode-line-face
;    :foreground "#c82829"
;    :background "#ffffff"
;    :box '(:line-width 2 :color "#c82829"))
;(set-face-attribute 'mode-line-folder-face nil
;    :inherit 'mode-line-face
;    :weight 'extra-light
;    :height 110
;    :foreground "gray90")
;(set-face-attribute 'mode-line-filename-face nil
;    :inherit 'mode-line-face
;    :foreground "#eab700"
;    :weight 'bold)
;(set-face-attribute 'mode-line-position-face nil
;    :inherit 'mode-line-face
;    :family "Menlo")
;(set-face-attribute 'mode-line-mode-face nil
;    :inherit 'mode-line-face
;    :foreground "white")
;(set-face-attribute 'mode-line-minor-mode-face nil
;    :inherit 'mode-line-mode-face
;    :foreground "gray60"
;    :height 100)
;(set-face-attribute 'mode-line-process-face nil
;    :inherit 'mode-line-face
;    :foreground "#718c00")
;(set-face-attribute 'mode-line-80col-face nil
;    :inherit 'mode-line-position-face
;    :foreground "black" :background "#eab700")
;(set-face-attribute 'mode-line-delim-face-1 nil
;    :inherit 'mode-line-face
;    :foreground "white")

;; 行番号を常に表示する
(require 'linum)
(global-linum-mode t)

;; 行番号の表示領域として確保する桁数
(setq linum-format "%5d")

;; カラム番号を表示
(column-number-mode t)

;; 改行コードを表示
;; 標準では
;;    :     LF
;;  (DOS)   CRLF
;;  (Mac)   CR
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; 時計表示
;(display-time-mode 1)
;(setq display-time-24hr-format t)

;; ファイルサイズを表示
;(size-indication-mode t)

;; バッテリー表示
;(display-battery-mode 1)

;; .emacs.d/inits/06_modeline.el ends here
