scriptencoding utf-8

"===========================================================
" .vimrc
"
"                        Last Modified: 2014-01-10 15:46:24
"===========================================================

" vi 互換をオフにする
set nocompatible

"-------------------------------------------------
" OS
"-------------------------------------------------

" Windows
if has('win32') || has('win64')

    " パスの区切り文字を / にする
    set shellslash

    " Mac/Linux と環境をそろえる
    set runtimepath+=$HOME/.vim,$HOME/.vim/after

endif

"-------------------------------------------------
" ウインドウ
"-------------------------------------------------

" 行番号を表示
set number

" ルーラーを表示
set ruler

" 不可視文字を表示する (nolist:非表示)
set list

" 不可視文字を表示するときの記号
set listchars=tab:>\ ,extends:<,trail:_

" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap

" 常にステータスバーを表示
set laststatus=2

" コマンドラインの高さ
set cmdheight=2

" コマンドを表示
set showcmd

" タイトルを表示
set title

" ステータスラインに文字コードと改行コードを表示する
set statusline=%<%f\ %m%r%h%w\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%=%l,%c%V%8P

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"-------------------------------------------------
" 検索
"-------------------------------------------------

" インクリメンタルサーチ
set incsearch

" 大文字/小文字を無視 (noignorecase:無視しない)
set ignorecase

" 大文字/小文字両方を含んでいる場合はそれらを区別する
set smartcase

" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

"-------------------------------------------------
" 編集
"-------------------------------------------------

" 自動インデントでずれる幅
set shiftwidth=4

" タブの画面上での幅
set tabstop=4

" タブをスペースに展開する (noexpandtab:展開しない)
set expandtab

" 改行時に前の行のインデントを継続する (noautoindent:インデントしない)
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch

" 対応括弧の瞬間強調表示
set matchtime=3

" コマンドライン補完するときに強化されたものを使う
set wildmenu

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

"-------------------------------------------------
" ファイル操作
"-------------------------------------------------

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

"保存されていないファイルがあるときでも別のファイルを開くことができる
set hidden

"終了時に保存されていないファイルがあるときはに保存確認
set confirm

"-------------------------------------------------
" タブ関連
"-------------------------------------------------

" タブページを常に表示
set showtabline=2

" gVimでもテキストベースのタブページを使う
set guioptions-=e

"-------------------------------------------------
" プラグイン
"-------------------------------------------------

if filereadable(expand('~/.vimrc.plugin'))
  source ~/.vimrc.plugin
endif

" .vimrc ends here
