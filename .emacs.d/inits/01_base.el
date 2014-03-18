;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/01_base.el
;;
;;                       Last Modified: 2013-11-20 16:47:14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;------------------------------------------------
;; Server
;;------------------------------------------------

(require 'server)
(unless (server-running-p)
  (server-start))

;;------------------------------------------------
;; OS
;;------------------------------------------------

;; 判定
(defvar macp (eq system-type 'darwin))      ; Mac
(defvar linuxp (eq system-type 'gnu/linux)) ; Linux
(defvar winp (eq system-type 'windows-nt))  ; Windows

;; .emacs.d/inits/01_base.el ends here
