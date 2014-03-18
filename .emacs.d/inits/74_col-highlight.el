;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/74_col-highlight.el
;;
;;                       Last Modified: 2014-01-22 17:29:35
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'col-highlight)

;; 常にハイライト
;(column-highlight-mode 1)

;; 指定した秒数アイドル時間が続くとハイライト
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 6)

;; .emacs.d/inits/74_col-highlight.el ends here
