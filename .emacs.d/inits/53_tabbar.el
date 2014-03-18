;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/53_tabbar.el
;;
;;                       Last Modified: 2013-12-12 00:34:31
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'tabbar)
(tabbar-mode 1)

(setq tabbar-buffer-groups-function nil) ; グループ化しない

(dolist (btn '(tabbar-buffer-home-button ; 左に表示されるボタンを無効化
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

(setq tabbar-separator '(0.8)) ; タブ同士の間隔

(set-face-attribute                     ; 外観変更
 'tabbar-default nil
 :family (face-attribute 'default :family)
 :background (face-attribute 'mode-line-inactive :background)
 :height 0.9)
(set-face-attribute
 'tabbar-unselected nil
 :background (face-attribute 'mode-line-inactive :background)
 :foreground (face-attribute 'mode-line-inactive :foreground)
 :box nil)
(set-face-attribute
 'tabbar-selected nil
  :background (face-attribute 'mode-line :background)
  ;:foreground (face-attribute 'mode-line :foreground)
 :foreground "tomato"
 :box nil)

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
((buffer-live-p b) b)))
(buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; .emacs.d/inits/53_tabbar.el ends here

