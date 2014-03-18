;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/99_color.el
;;
;;                       Last Modified: 2014-01-22 17:32:01
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 色
;; キーワードは各モードの設定で。

(custom-set-faces
 '(default ((t (:background "#111111" :foreground "#EEEEEE"))))
 ;; カーソル
 '(cursor (
           (((class color) (background dark )) (:background "#2e8b57"))
           (((class color) (background light)) (:background "#999999"))
           (t ())
           ))
 ;; 現在行
 '(hl-line (
            (((class color) (background dark)) (:background "DarkSlateGray"))
            (((class color) (background light)) (:background "DarkSlateGray"))
            (t ())
            ))
;; 現在列(col-highligh)
 '(col-highlight (
                  (((class color) (background dark)) (:background "DarkSlateGray"))
                  (((class color) (background light)) (:background "DarkSlateGray"))
                  (t ())
                  ))
 ;; コメント
 '(font-lock-comment-face ((t (:italic t :foreground "slate gray"))))
 )

;; IME OFF時の初期カーソルカラー
(set-cursor-color "#2e8b57")

;; .emacs.d/inits/99_color.el ends here
