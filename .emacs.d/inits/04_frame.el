;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/04_frame.el
;;
;;                       Last Modified: 2014-01-22 15:21:20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; フレーム透過設定
(add-to-list 'default-frame-alist '(alpha . (0.90 0.90)))

;; 位置
(setq default-frame-alist
      (append '((top . 50) ; フレームの Y 位置(ピクセル数)
                (left . 45) ; フレームの X 位置(ピクセル数)
                (width . 100) ; フレーム幅(文字数)
                (height . 35) ; フレーム高(文字数)
                )
              default-frame-alist))

;; 起動時メッセージ非表示
(setq inhibit-startup-message t)

;; scratch の初期メッセージ消去
(setq initial-scratch-message "")

;; タイトルバー
(setq frame-title-format "Emacs %b - %f")

;; ファイル名が重複していたらディレクトリ名を追加する。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; メニューバーを隠す
(tool-bar-mode -1)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; スクロールを一行ずつにする
(setq scroll-step 1)

;; 画面端でスクロールしたときにカーソルが飛ばない
(setq scroll-conservatively 100)

;; 現在行をハイライトする
(global-hl-line-mode)

;; 現在列をハイライトする
;; col-highlight を利用

;; 行間
(setq-default line-spacing 0)

;; .emacs.d/inits/04_frame.el ends here
