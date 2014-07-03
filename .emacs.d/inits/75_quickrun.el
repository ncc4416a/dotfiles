;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/75_quickrun.el
;;
;;                       Last Modified: 2014-06-17 01:12:25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'quickrun)
(push '("*quickrun*") popwin:special-display-config)
(global-set-key (kbd "<f5>") 'quickrun)

;; Markdown
(when macp
  (quickrun-add-command "markdown"
                      '((:command . "/usr/local/bin/Markdown.pl")
                        (:outputter . "buffer"))))
(when linuxp
  (quickrun-add-command "markdown"
                        '((:command . "Markdown.pl")
                          (:outputter . "buffer"))))
(when winp
  (quickrun-add-command "markdown"
                        '((:command . "C:\usr\local\strawberry\bin\perl.exe")
                          (:cmdoput . "C:\usr\local\strawberry\bin\Markdowon.pl")
                          (:exec . "%c %o %s")
                          (:outputter . "buffer"))))

;; .emacs.d/inits/75_quickrun.el
