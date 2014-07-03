scriptencoding utf-8

"###########################################################
" .gvimrc
"
"                        Last Modified: 2014-07-02 19:38:57
"###########################################################

"=================================================
" 日本語
"=================================================

" フォント
if has('win32') || has('win64')
  set guifont=ＳＨ_Ｇ30-M:h10:cSHIFTJIS
  "set guifont=MS_Gothic:h12:cSHIFTJIS
  "set guifont=Ricty:h16:cSHIFTJIS
elseif has('mac')
  "set guifont=Osaka－等幅:h18
  set guifont=Ricty:h16
endif

" 挿入モード・検索モードでのデフォルトのIME状態
if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

" 日本語入力固定モード(MacVim-kaoriya)
if has('mac') && has('kaoriya')
    set noimdisableactivate
endif

"=================================================
" ウインドウ
"=================================================

" 幅/高さ
if has('win32') || has('win64')
    set columns=120
    set lines=40
else
    set columns=100
    set lines=40
endif

" コマンドラインの高さ
set cmdheight=2

"ビープ音すべてを無効にする
set visualbell t_vb=

" カーソルを点滅させない
set guicursor=a:blinkon0
"
"" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" ツールバーを削除
set guioptions-=T

"メニューを削除
set guioptions-=m

" gVimでもテキストベースのタブページを使う
set guioptions-=e

" 透過(KaoriYa版のみ)
if has('kaoriya')
    set transparency=10
endif

"=================================================
" 色
"=================================================

syntax on
set t_Co=256

" カラースキーム
"let mycolorscheme = "hybrid"
let mycolorscheme = "landscape"

if (mycolorscheme == "solarized")
    set background=dark
    let g:solarized_termcolors=256
    colorscheme solarized
elseif (mycolorscheme == "hybrid")
    set background=dark
    colorscheme hybrid
elseif (mycolorscheme == "molokai")
    colorscheme molokai
elseif (mycolorscheme == "landscape")
    colorscheme landscape
endif

" IME On/Off 時のカーソル
if has('win32') || has('win64') || has('mac')
    highlight Cursor guifg=NONE guibg=Red
    highlight CursorIM guifg=NONE guibg=Green
endif

" カーソル行
set cursorline
highlight CursorLine ctermbg=DarkGray

" カーソル列
set cursorcolumn
highlight CursorColumn ctermbg=DarkGray

" コメント
"highlight Comment ctermfg=DarkGray guifg=DarkGray cterm=Italic gui=Italic

" タブや改行などを表示(set list)したときの色
"highlight SpecialKey term=underline ctermfg=DarkGray guifg=DarkGray
"highlight NonText term=underline ctermfg=DarkGray guifg=DarkGray

" " 行末の空白文字
" function! WhiteSpaceEOL()
"     highlight WhiteSpaceEOL cterm=underline ctermfg=Red ctermbg=Red guibg=Red
" endfunction
" if has('syntax')
"     augroup WhiteSpaceEOL
"         autocmd!
"         autocmd ColorScheme * call WhiteSpaceEOL()
"         autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('WhiteSpaceEOL', '\s\+$')
"     augroup END
"     call WhiteSpaceEOL()
" endif

" 全角スペース
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=Magenta ctermbg=Magenta guibg=Magenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m2=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" " 行頭の Tab 文字
" function! TabStringBOL()
"     highlight TabStringBOL cterm=underline ctermfg=Red ctermbg=Red guibg=Red
" endfunction
" if has('syntax')
"     augroup TabStringBOL
"         autocmd!
"         autocmd ColorScheme * call TabStringBOL()
"         autocmd VimEnter,WinEnter,BufRead * let w:m3=matchadd('TabStringBOL', '^\t\+')
"     augroup END
"     call TabStringBOL()
" endif

" .gvimrc ends here

