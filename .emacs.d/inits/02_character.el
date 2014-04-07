;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs.d/inits/02_character.el
;;
;;                       Last Modified: 2014-04-08 01:24:32
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 言語を日本語にする
(set-language-environment 'Japanese)

;; 文字コード/改行コード (Mac)
(when macp
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;; 文字コード/改行コード (Linux)
(when linuxp
  (set-default-coding-systems 'utf-8-unix)
  (set-keyboard-coding-system 'utf-8-unix)
  (set-terminal-coding-system 'utf-8-unix)
  (set-buffer-file-coding-system 'utf-8-unix)
  (prefer-coding-system 'utf-8-unix))

;; 文字コード/改行コード (Windows)
(when winp
  (set-default-coding-systems 'shift_jis-dos)
  (set-keyboard-coding-system 'shift_jis-dos)
  (set-terminal-coding-system 'shift_jis-dos)
  (set-buffer-file-coding-system 'shift_jis-dos)
  (prefer-coding-system 'shift_jis-dos)
  (setq file-name-coding-system 'shift_jis-dos))

;; IME
;; *scratch* バッファで IME を有効化した状態で
;; (mac-get-current-input-source) を評価(C-j)で分かる
(cond (macp
       ;; 標準IMEの設定
       (setq default-input-method "MacOSX")
       ;; IME状態のモードライン表示
       ;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok26.Japanese" `title "あ") ; ATOK 2013 for Mac
       (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "ぐ") ; Google 日本語入力
       ;; カーソルの色
       ;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok26.Japanese" `cursor-color "green") ; ATOK 2013 for Mac
       (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `cursor-color "green") ; Google 日本語入力
       (mac-set-input-method-parameter "com.apple.keylayout.US" `cursor-color "red")
       ;; Emacs 起動時は IME OFF で始める
       (add-hook 'after-init-hook 'mac-change-language-to-us)
       ;; minibuffer 内は IME を OFF にする
       (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
       ;; [MIGEMO] I-search のとき IME を OFF にする
       (add-hook 'isearch-mode-hook 'mac-change-language-to-us))

      (winp
       ;; 標準IMEの設定
       (setq default-input-method "W32-IME")
       (w32-ime-initialize)
       ;; IME状態のモードライン表示
       (setq-default w32-ime-mode-line-state-indicator "[--]")
       (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
       ;; カーソルの色
       (add-hook 'input-method-activate-hook
                 (lambda() (set-cursor-color "green")))
       (add-hook 'input-method-inactivate-hook
                 (lambda() (set-cursor-color "#2e8b57")))
       ;; バッファ切り替え時にIMEの状態を引き継ぐ
       (setq w32-ime-buffer-switch-p nil)))

;; .emacs.d/inits/02_character.el ends here
