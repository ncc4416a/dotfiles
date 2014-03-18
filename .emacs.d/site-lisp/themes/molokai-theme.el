;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; molokai-theme.el
;;
;;                       Last Modified: 2013-10-31 11:35:49
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftheme molokai
  "Molokai color theme")

(custom-theme-set-faces
 'molokai
 ; 背景・文字・カーソル
 '(cursor ((t (:foreground "#F8F8F0"))))
 '(default ((t (:background "#1B1D1E" :foreground "#F8F8F2"))))

 ; 選択範囲
 '(region ((t (:background "#403D3D"))))

 ; モードライン
 '(mode-line ((t (:foreground "#F8F8F2" :background "#000000"
                              :box (:line-width 1 :color "#000000" :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground nil :background nil))))
 '(mode-line-inactive ((t (:foreground "#BCBCBC" :background "#333333"
                                       :box (:line-width 1 :color "#333333")))))

 ; ハイライト
 '(highlight ((t (:foreground "#000000" :background "#C4BE89"))))
 '(hl-line ((t (:background "#293739"))))

 ; 関数名
 '(font-lock-function-name-face ((t (:foreground "#FFFFFF"))))

 ; 変数名・変数の内容
 '(font-lock-variable-name-face ((t (:foreground "#FFFFFF"))))
 '(font-lock-string-face ((t (:foreground "#E6DB74"))))

 ; 特定キーワード
 '(font-lock-keyword-face ((t (:foreground "#F92672"))))

 ; Boolean
 '(font-lock-constant-face((t (:foreground "#AE81BC"))))

 ; 括弧
 '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "#FD971F"))))
 '(paren-face ((t (:foreground "#A6E22A" :background nil))))

 ; コメント
 '(font-lock-comment-face ((t (:foreground "#74715D"))))

 )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'molokai)


;; molokai-theme.el ends here
