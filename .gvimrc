scriptencoding utf-8

"===========================================================
" .gvimrc
"
"                        Last Modified: 2014-01-10 19:17:13
"===========================================================

"-------------------------------------------------
" 色
"-------------------------------------------------

" カラースキーム
"colorscheme hybrid
colorscheme landscape

" カーソル
if has('win32') || has('win64') || has('multi_byte_ime') || has('mac')
  " IME OFF 時のカーソルの色
"  highlight Cursor guifg=NONE guibg=Red
  " IME ON 時のカーソルの色
  highlight CursorIM guifg=NONE guibg=Green
endif

" カーソル行
set cursorline
highlight CursorLine ctermbg=DarkGray

" カーソル列
set cursorcolumn
highlight CursorColumn ctermbg=DarkGray

" タブや改行などを表示(set list)したときの色
"highlight SpecialKey term=underline ctermfg=DarkGray guifg=DarkGray
"highlight NonText term=underline ctermfg=DarkGray guifg=DarkGray

" 全角スペース
"highlight ZenkakuSpace cterm=underline ctermfg=DarkMagenta guibg=DarkMagenta
highlight ZenkakuSpace guifg=NONE guibg=DarkMagenta
autocmd BufNewFile,BufRead * match ZenkakuSpace /　/

" 行末の空白文字
"highlight TrailingSpaces cterm=underline ctermfg=DarkMagenta guibg=DarkMagenta
highlight TrailingSpaces guifg=NONE guibg=Red
autocmd BufNewFile,BufRead * match TrailingSpaces /\s\+$/

"-------------------------------------------------
" ウインドウ
"-------------------------------------------------

" 幅
set columns=100

" 高さ
set lines=35

" コマンドラインの高さ
set cmdheight=2

" 透過
set transparency=5

"ビープ音すべてを無効にする
set visualbell t_vb=

" カーソルを点滅させない
set guicursor=a:blinkon0

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" ツールバーを削除
set guioptions-=T

"メニューを削除
"set guioptions-=m

"-------------------------------------------------
" 日本語
"-------------------------------------------------

" フォント
if has('win32') || has('win64')
  set guifont=MS_Gothic:h9:cSHIFTJIS
  "set guifont=Ricty:h16:cSHIFTJIS
elseif has('mac')
  "set guifont=Osaka－等幅:h18
  set guifont=Ricty:h16
endif

" 挿入モード・検索モードでのデフォルトのIME状態
if has('win32') || has('win64') || has('multi_byte_ime') || has('mac')
  set iminsert=0 imsearch=0
endif

"-------------------------------------------------
" マウス
"-------------------------------------------------

" マウスの入力を受け付ける
set mouse=a

"-------------------------------------------------
" 検索
"-------------------------------------------------

" ハイライト
set hlsearch

"-------------------------------------------------
" ファイル操作
"-------------------------------------------------

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" .gvimrc ends here
