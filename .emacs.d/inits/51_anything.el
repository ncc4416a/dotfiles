;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/51_anything.el
;;
;;                       Last Modified: 2014-01-16 16:28:35
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'anything-startup)

(require 'anything-migemo)
(setq anything-use-migemo t)

(setq recentf-max-menu-items 10)   ; 表示するファイルの数
(setq recentf-max-saved-items 30)  ; 保存するファイルの数
(setq kill-ring-max 100)           ; kill-ring で保存される最大値

;; キーバインド
(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "C-'") 'anything-for-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x M-x") 'anything-M-x)


;; .emacs.d/inits/51_anything.el ends here
