;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/33_markdown-mode.el
;;
;;                       Last Modified: 2014-01-15 21:27:02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))

(when macp
  (setq markdown-command "/usr/local/bin/Markdown.pl"))

(when winp
  (setq markdown-command "C:/usr/local/strawberry/perl/bin/perl.exe C:/usr/local/strawberry/perl/bin/Markdown.pl"))

;; キーワード
(custom-set-faces
 '(markdown-header-delimiter-face ((t (:foreground "Red" :weight bold))))
 '(markdown-header-face-1 ((t (:foreground "OrangeRed" :weight bold))))
 '(markdown-header-face-2 ((t (:foreground "tomato" :weight bold))))
 '(markdown-header-face-3 ((t (:foreground "LightCoral" :weight bold))))
 '(markdown-header-face-4 ((t (:foreground "coral" :weight bold))))
 '(markdown-header-face-5 ((t (:foreground "DarkOrange" :weight bold))))
 '(markdown-header-face-6 ((t (:foreground "LightSalmon" :weight bold))))
 )

;; .emacs.d/inits/33_markdown-mode.el end here


