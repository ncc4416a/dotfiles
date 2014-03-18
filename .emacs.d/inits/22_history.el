;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/22_history.el
;;
;;                       Last Modified: 2013-11-20 15:28:34
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; メニュー表示
(recentf-mode t)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; 履歴数を大きくする
(setq history-length 10000)

;; 最近開いたファイルの保存数
(setq recentf-max-saved-items 1000)

;; 表示するファイル数
(setq recentf-max-menu-items 10)

;; kill-ring の保存数
(setq kill-ring-max 100)

;; .emacs.d/inits/22_history.el ends here
