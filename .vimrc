scriptencoding utf-8

"###########################################################
" .vimrc
"
"                        Last Modified: 2014-07-03 23:42:23
"###########################################################

" vi 互換をオフにする
set nocompatible

"=================================================
" プラットフォーム
"=================================================

" Windows
if has('win32') || has('win64')
    " パスの区切り文字を / にする
    set shellslash
    " Mac/Linux と環境をそろえる
    set runtimepath+=$HOME/.vim,$HOME/.vim/after

    " KaoriYa 版の場合
    if has('kaoriya')
        let plugin_cmdex_disable = 1
        let plugin_autodate_disable  = 1
    endif

    " KaoriYa 版でない場合
    if ! has('kaoriya')
        " 文字コード
        " 文字化けしたら 「:e ++enc=文字コード」で変更
        set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
    endif
endif
" 幅
set columns=100

" 高さ
set lines=35

" Mac
if has('mac')
    " KaoriYa 版の場合
    if has('kaoriya')
        let plugin_cmdex_disable = 1
    endif
endif

" Linux
if has('unix') && !has('mac')
endif

"=================================================
" 日本語
" im_control.vim も参照
"=================================================

" 挿入モードから抜けた時に IME をオフにし、
" 再度挿入モードに入った時に IME の状態を元に戻す
"inoremap <silent> <Esc> <Esc>
"inoremap <silent> <C-[> <Esc>
"inoremap <silent> <C-j> <C-^>

" TeraTerm
" http://ttssh2.sourceforge.jp/manual/ja/usage/tips/vim.html
"let &t_SI .= "\e[<r"
"let &t_EI .= "\e[<s\e[<0t"
"let &t_te .= "\e[<0t\e[<s"
"set timeoutlen=100

"=================================================
" 文字コード/改行コード
"=================================================

if &encoding !=# 'utf-8'
  set encoding=cp932
  set fileencoding=cp932
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=dos,unix,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
" 改行コードの自動認識
set fileformats=dos,unix,mac

"=================================================
" キーマップ
"=================================================

" <leader> の変更
let mapleader = ','

" 新規タブを一番右に追加する
nnoremap <leader>tc :tablast<CR>:tabnew<CR>

" タブを一番右に移動する
nnoremap <leader>tv :tabmove<CR>

" カーソルを表示行で移動する
" 物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

"=================================================
" ウインドウ
"=================================================

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

" タブページを常に表示
set showtabline=2

" ステータスラインに文字コードと改行コードを表示する
"set statusline=%<%f\ %m%r%h%w\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%=%l,%c%V%8P

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" カーソルの形状
" http://ttssh2.sourceforge.jp/manual/ja/usage/tips/vim.html
"let &t_SI .= "\e[4 q"
"let &t_EI .= "\e[2 q"

" マウスの入力を受け付ける
set mouse=a

" キーボードが押されたらマウスカーソルを隠す
set mousehide

"=================================================
" 検索
"=================================================

" インクリメンタルサーチ
set incsearch

" 大文字/小文字を無視 (noignorecase:無視しない)
set ignorecase

" 大文字/小文字両方を含んでいる場合はそれらを区別する
set smartcase

" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

" 検索結果をハイライト表示する
set hlsearch

" * や # で検索した時に移動しないようにする
nnoremap * *N
nnoremap # #N

"=================================================
" 編集
"=================================================

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

" 編集時の自動改行
set textwidth=0

" 編集時の自動改行の設定
set formatoptions=q

" 編集時の自動改行を日本語に対応させる
set formatoptions+=mM

"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

"画面最後の行をできる限り表示する
set display+=lastline

" ペースト時にオートインデントしないようにする
"set paste

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch

" 対応括弧の瞬間強調表示
set matchtime=3

" コマンドライン補完するときに強化されたものを使う
set wildmenu

" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

"=================================================
" ファイル操作
"=================================================

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full

" バックアップファイルを作成しない
set nobackup

" ファイル上書き前にバックアップを作成する。
" (set backup が無効であれば上書き成功後削除される)
set writebackup

" スワップファイルを生成しない
set noswapfile

" undo ファイル (.{ファイル名}.un~/7.4.227より) を生成しない
if version >= 704
    set noundofile
endif

"保存されていないファイルがあるときでも別のファイルを開くことができる
set hidden

"終了時に保存されていないファイルがあるときはに保存確認
set confirm

" 拡張子が .textile の時は filetype が textile になるようにする
autocmd BufRead,BufNewFile *.textile set filetype=textile

"=================================================
" プラグイン
"=================================================

"-----------------------------
" NeoBundle
"-----------------------------
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

"-----------------------------
" Alignta
"-----------------------------
NeoBundle 'h1mesuke/vim-alignta'

"-----------------------------
" autodate.vim
"-----------------------------
NeoBundle 'autodate.vim'

:let autodate_keyword_pre = '\cLast Modified:[ \t]\+'
:let autodate_keyword_post = '$'
:let autodate_format = '%Y-%m-%d %H:%M:%S'
:let autodate_start_line = 1
:let autodate_lines = 15

"-----------------------------
" awk
"-----------------------------
NeoBundle "awk.vim"

"-----------------------------
" HybridText
"-----------------------------
NeoBundle 'HybridText'

"-----------------------------
" im_control.vim
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control
"-----------------------------
NeoBundle 'fuenor/im_control.vim'

if has('win32') || has('win64')
    let IM_CtrlMode = 4
    inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
elseif has('mac')
    if has('kaoriya')
        let IM_CtrlMode = 4
        inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
        "let IM_CtrlMacVimKaoriya = 0
    else
        let IM_CtrlMode =1
        inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
    endif
elseif has('unix') && !has('mac')
    if has('gui_runnig')
        let IM_CtrlMode = 1
        inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
    else
        let IM_CtrlMode = 0
    endif
endif

"-----------------------------
" landscape
"-----------------------------
NeoBundle 'itchyny/landscape.vim'

"-----------------------------
" lightline.vim
"-----------------------------
NeoBundle 'itchyny/lightline.vim'
set t_Co=256
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
            \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'charcode', 'fileencoding', 'fileformat', 'filetype' ] ]
            \ },
            \ 'component_function': {
            \   'modified': 'MyModified',
            \   'readonly': 'MyReadonly',
            \   'fugitive': 'MyFugitive',
            \   'filename': 'MyFilename',
            \   'fileformat': 'MyFileformat',
            \   'filetype': 'MyFiletype',
            \   'fileencoding': 'MyFileencoding',
            \   'mode': 'MyMode'
            \ }
            \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"-----------------------------
" linediff.vim
"-----------------------------
NeoBundle 'AndrewRadev/linediff.vim'

"-----------------------------
" migemo
"-----------------------------
NeoBundle 'haya14busa/vim-migemo'

"-----------------------------
" memolist.vim
"-----------------------------
NeoBundle 'glidenote/memolist.vim'
let g:memolist_memo_suffix = "txt"
let g:memolist_path = "~/Documents/memo"

"-----------------------------
" molokai
"-----------------------------
NeoBundle 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

"-----------------------------
" NERDTree
"-----------------------------
NeoBundle 'scrooloose/nerdtree'

"隠しファイルを表示する
let NERDTreeShowHidden = 1

"-----------------------------
" open-browser.vim
"-----------------------------
NeoBundle 'tyru/open-browser.vim'

"-----------------------------
" operator
"-----------------------------
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'

"-----------------------------
" previm
"-----------------------------
NeoBundle 'kannokanno/previm'
"let g:previm_open_cmd = 'open -a Firefox'
"let g:previm_open_cmd = 'open -a Safari'

"-----------------------------
" QuickRun
"-----------------------------
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}

if has('win32') || has('win64')
    let g:quickrun_config['markdown'] = {
                \ 'command'  : 'perl',
                \ 'cmdopt'   : 'C:\usr\local\strawberry\perl\bin\Markdown.pl',
                \ 'exec'     : '%c %o %s',
                \ 'outputter': 'buffer',
                \ }

    " noshellshash 対策
    function! s:hook_quickrun_windows()
        let hook = {
            \    'name' : 'myHook',
            \    'kind' : 'hook',
            \ }

        function! hook.init(session)
            let self.save_shellslash = &shellslash
            set noshellslash
        endfunction

        function! hook.sweep()
            let &shellslash = self.save_shellslash
            unlet! self.save_shellslash
        endfunction

        call quickrun#module#register(hook)
        "autocmd MYAUTOCMD FileType quickrun setl ff=dos

    endfunction

    call s:hook_quickrun_windows()

    let g:quickrun_config['textile'] = {}
endif

if has('mac')
    let g:quickrun_config['markdown'] = {
                \ 'command'  : 'Markdown.pl',
                \ 'outputter': 'buffer',
                \ }
    let g:quickrun_config['textile'] = {}
endif

if has('unix')
    let g:quickrun_config['markdown'] = {
                \ 'command'  : 'Markdown.pl',
                \ 'outputter': 'buffer',
                \ }
    let g:quickrun_config['textile'] = {}
endif

"-----------------------------
" scratch.vim
"-----------------------------
NeoBundle 'mtth/scratch.vim'

"-----------------------------
" Solarized
"-----------------------------
NeoBundle 'altercation/vim-colors-solarized'

"-----------------------------
" surround.vim
"-----------------------------
NeoBundle 'tpope/vim-surround'

"-----------------------------
" text-object
"-----------------------------
NeoBundle 'kana/vim-textobj-user'
NeoBundle "osyo-manga/vim-textobj-multiblock"

"-----------------------------
" tcomment_vim
"-----------------------------
NeoBundle 'tomtom/tcomment_vim'

"-----------------------------
" textile
"-----------------------------
NeoBundle 'timcharper/textile.vim'

"-----------------------------
" unite.vim/neomru.vim
"-----------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" 入力モードで開始する
let g:unite_enable_start_insert = 1

"-----------------------------
" Unite Plugins
"-----------------------------
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-session'

"-----------------------------
" VimFiler
"-----------------------------
NeoBundle 'Shougo/vimfiler'

"-----------------------------
" vimproc
"-----------------------------
NeoBundle 'Shougo/vimproc'

"-----------------------------
" vimshell.vim
"-----------------------------
NeoBundle 'Shougo/vimshell.vim'

"-----------------------------
" vim-hybrid
"-----------------------------
NeoBundle 'w0ng/vim-hybrid'
let g:hybrid_use_iTerm_colors = 1

"-----------------------------
" vim-indent-guides
"-----------------------------
NeoBundle 'nathanaelkane/vim-indent-guides'

" 起動時から有効にする
"let g:indent_guides_enable_on_vim_startup = 1
" ハイライト・ガイドの設定
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"-----------------------------
" vim-markdown
" http://rcmdnk.github.io/blog/2013/11/17/computer-vim/
" http://rcmdnk.github.io/blog/2014/06/09/computer-vim/
"-----------------------------
NeoBundle 'rcmdnk/vim-markdown'
let g:vim_markdown_folding_disabled = 1

"-----------------------------
" vim-notes
"-----------------------------
NeoBundle 'xolox/vim-notes'

" 保存ディレクトリ
:let g:notes_directories = ['~/Documents/Notes']
" サフィックス
:let g:notes_suffix = '.txt'

"-----------------------------
" vim-qfreplace
"-----------------------------
NeoBundle 'thinca/vim-qfreplace'

"-----------------------------
" vim-quickhl
"-----------------------------
NeoBundle 't9md/vim-quickhl'

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)

"-----------------------------
" vim-session
"-----------------------------
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
let g:session_directory = "~/.vim-session"
let g:session_autosave = 'no'
let g:session_autoload = 'no'

"-----------------------------
" vim-smartinput
"-----------------------------
NeoBundle 'kana/vim-smartinput'

"-----------------------------
" vim-table-mode
"-----------------------------
NeoBundle 'dhruvasagar/vim-table-mode'

"-----------------------------
" vim-visualstar
"-----------------------------
NeoBundle 'thinca/vim-visualstar'

" * や # で検索した時に移動しないようにする
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N

" * や # で検索した時に移動しないようにする
" (N に別のキーマップが設定されている場合)
"noremap <Plug>N N
"map * <Plug>(visualstar-*)<Plug>N
"map # <Plug>(visualstar-#)<Plug>N

"-----------------------------
" vital.vim
"-----------------------------
NeoBundle 'vim-jp/vital.vim'

"-----------------------------
" ファイルタイプを戻す
"-----------------------------
filetype plugin indent on

"=================================================
" My VimScript
"=================================================

"-----------------------------
" パスワードを生成する
"-----------------------------

" パスワードに使用する文字列の初期化
let s:makepasswordchars = ''

" パスワードに使う文字列の初期値
let g:makepassword_use_capital_letter = 1
let g:makepassword_use_small_letter = 1
let g:makepassword_use_figure = 1
let g:makepassword_use_symbol = 0

" 使用する文字
"  見分けにくい文字は除外してある

" 英大文字
if (g:makepassword_use_capital_letter)
    let s:makepasswordchars .= 'ABCDEFGHJKLMNPQRSTUVWXYZ'
endif
" 英小文字
if (g:makepassword_use_small_letter)
    let s:makepasswordchars .= 'abcdefghijkmnpqrstuvwxyz'
endif
" 数字
if (g:makepassword_use_figure)
    let s:makepasswordchars .= '123456789'
endif
" 記号
if (g:makepassword_use_symbol)
    let s:makepasswordchars .= '!"#$%&''()-=^~\|@`[{;+:*}},<.>/?_'']`"'
endif

" ランダム文字列生成
let s:V = vital#of('vital')
let s:Xor = s:V.import('Random.Xor128')
function! s:randomString(char_kind, length)
    let s:rand_str = ''
    for i in range(a:length)
        let s:rand_char = a:char_kind[abs(s:Xor.rand()) % len(a:char_kind)]
        let s:rand_str .= s:rand_char
    endfor
    return s:rand_str
endfunction

" パスワード生成
function! MakePassword()
    let a:inputlength = input("Password Length: ")
    let s:passwd = s:randomString(s:makepasswordchars, a:inputlength)
    echo "\n"
    echo s:passwd

    if has('win32') || has('win64')
        let @+ = s:passwd
    elseif has('mac')
        let @+ = s:passwd
    else
        let @" = s:passwd
    endif
endfunction

" キーマップ
nnoremap <leader>mkp :call MakePassword()<CR>

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

" 行末の空白文字
function! WhiteSpaceEOL()
    highlight WhiteSpaceEOL cterm=underline ctermfg=Red ctermbg=Red guibg=Red
endfunction
if has('syntax')
    augroup WhiteSpaceEOL
        autocmd!
        autocmd ColorScheme * call WhiteSpaceEOL()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('WhiteSpaceEOL', '\s\+$')
    augroup END
    call WhiteSpaceEOL()
endif

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
"
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

" .vimrc ends here
