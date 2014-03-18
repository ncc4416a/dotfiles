;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/03_font.el
;;
;;                       Last Modified: 2013-11-20 15:26:22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Mac
(when macp
  (create-fontset-from-ascii-font "Ricty-16:weight=normal:slant=normal" nil "ricty")
  (set-fontset-font "fontset-ricty"
                    'unicode
                    (font-spec :family "Ricty" :size 16)
                    nil
                    'append)
  (add-to-list 'default-frame-alist '(font . "fontset-ricty"))
  )

;;(when macp
;;  (let* ((size 16)
;;         (asciifont "Ricty") ; ASCII fonts
;;         (jpfont "Ricty") ; Japanese fonts
;;         (h (* size 10))
;;         (fontspec (font-spec :family asciifont))
;;         (jp-fontspec (font-spec :family jpfont)))
;;    (set-face-attribute 'default nil :family asciifont :height h)
;;    ;; (set-face-bold-p 'bold nil)
;;    (set-fontset-font t 'japanese-jisx0213.2004-1 jp-fontspec)
;;    (set-fontset-font t 'japanese-jisx0213-2 jp-fontspec)
;;    (set-fontset-font t 'japanese-jisx0213-1 jp-fontspec)
;;    (set-fontset-font t 'japanese-jisx0212 jp-fontspec)
;;    (set-fontset-font t 'japanese-jisx0208 jp-fontspec)
;;    (set-fontset-font t 'katakana-jisx0201 jp-fontspec)
;;    (set-fontset-font t '(#x0080 . #x024F) fontspec)
;;    (set-fontset-font t '(#x0370 . #x03FF) fontspec)))

;; Windows
(when winp
  (setq w32-enable-synthesized-fonts t)
  (create-fontset-from-ascii-font
   "-outline-ＭＳ ゴシック-normal-r-normal-normal-14-*-*-*-*-*-iso8859-1"
   nil "myfont")
;  (create-fontset-from-ascii-font "Ricty-16:weight=normal:slant=normal" nil "myfont")
  (set-fontset-font "fontset-myfont"
                    'japanese-jisx0208
                    '("ＭＳ ゴシック" . "unicode-bmp")
                    )
  (set-fontset-font "fontset-myfont"
                    'katakana-jisx0201
                    '("ＭＳ ゴシック" . "unicode-bmp")
                    )
  (add-to-list 'default-frame-alist '(font . "fontset-myfont"))
  )

;; イタリックを持つフォントを利用時はコメントをイタリックに
(custom-set-faces
  '(font-lock-comment-face ((t (:italic t)))))

;; .emacs.d/inits/03_font.el ends here
