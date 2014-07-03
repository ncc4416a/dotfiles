;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/20_search.el
;;
;;                       Last Modified: 2014-06-16 02:55:38
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 検索(全般)時には大文字/小文字の区別をしない
(setq case-fold-search t)

;; ファイル名補完時に大文字/小文字を区別しない
(setq completion-ignore-case t)

;; インクリメンタルサーチ時に大文字/小文字を区別しない
(setq isearch-case-fold-search t)

;; migemo
(require 'migemo)

(setq migemo-options '("-q" "--emacs"))
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1000)

(when macp
  (setq migemo-coding-system 'utf-8-hfs)
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))

(when linuxp
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))

(when winp
  (setq migemo-coding-system 'shift_jis-dos)
  (setq migemo-command (expand-file-name "~/.emacs.d/migemo/cmigemo"))
  (setq migemo-dictionary (expand-file-name "~/.emacs.d/migemo/dict/cp932/migemo-dict")))

(load-library "migemo")
(migemo-init)

;; .emacs.d/inits/20_search.el ends here
