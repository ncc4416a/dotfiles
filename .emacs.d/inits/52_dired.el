;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/52_dired.el
;;
;;                       Last Modified: 2013-12-12 00:38:41
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'dired)

;; diredを2つのウィンドウで開いている時に、
;デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)

;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)

;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

;; ディレクトリを開くときにバッファを複数生成しないようにする
(defun dired-open-in-accordance-with-situation ()
    (interactive)
    (cond ((string-match "\\(?:\\.\\.?\\)"
                         (format "%s" (thing-at-point 'filename)))
           (dired-find-alternate-file))
          ((file-directory-p (dired-get-filename))
           (dired-find-alternate-file))
          (t
           (dired-find-file))))
;; RETに割り当てる
(define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)

;; .emacs.d/inits/52_dired.el ends here
