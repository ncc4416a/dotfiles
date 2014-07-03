;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/05_file.el
;;
;;                       Last Modified: 2014-06-16 02:59:57
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; find-file のデフォルトディレクトリを "~/" にする
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; .emacs.d/inits/05_file.el ends here
