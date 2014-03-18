;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/07_keybind.el
;;
;;                       Last Modified: 2014-01-14 13:16:00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-h で Backspace
(keyboard-translate ?\C-h ?\C-?)

;; 改行キーでオートインデント
;;(global-set-key "\C-m" 'newline-and-indent)

;; 日本語入力 ON/OFF 時に "<M-kanji> is undefined"
;; メッセージが表示されるのを防ぐ
(global-set-key [M-kanji] 'ignore)

;; ドラッグ&ドロップ でファイルを開く
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

;; Mac
(when macp
  ;; option と command を入れ替え
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  ;; コントロールキーを Mac ではなく Emacs に渡す
  (setq mac-pass-control-to-system nil)
  (setq mac-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil)
  ;; \ でバックスラッシュを入力する
  (define-key global-map [?¥] [?\\])
  )

;; .emacs.d/inits/07_keybind.el
