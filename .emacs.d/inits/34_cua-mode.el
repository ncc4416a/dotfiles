
;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/34_cua-mode.el
;;
;;                       Last Modified: 2014-05-30 02:40:12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cua-mode t)

;; デフォルトキーバインドを無効化
(setq cua-enable-cua-keys nil)

;; cua モードでもクリップボード共有
; Mac
(when macp
  )
;; Windows
(when winp
  )
;; X
(when linuxp
  )

;; キーバインド
;(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; .emacs.d/inits/34_cua-mode.el end here
