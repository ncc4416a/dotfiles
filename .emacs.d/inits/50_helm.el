;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/50_helm.el
;;
;;                       Last Modified: 2013-12-10 13:53:09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'helm-config)

(require 'helm-migemo)
(setq helm-use-migemo t)

;; キーバインド
;(global-set-key (kbd "C-x b") 'helm-for-files)
;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;(global-set-key (kbd "C-x M-x") 'helm-M-x)

;; .emacs.d/inits/50_helm.el ends here
