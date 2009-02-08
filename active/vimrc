" Remap colemak back to qwerty for commands
source $HOME/.vim/qwerty-cmd.vim

" default colors
color delek
" Options
set nocompatible
set ruler
set showmode
set showmatch
set showcmd
set ignorecase

set expandtab
" TODO: tab settings should probably be language specific
" Nonetheless, I do want to have a worldwide default, maybe?

set autoindent
set autowrite

set backspace=2
set history=1000
set noincsearch
set hlsearch

set number
set laststatus=2

syntax on

filetype on
filetype indent on
filetype plugin on

" Allowing

" Remapping split window controls
nnoremap <C-w>n <C-w>j
nnoremap <C-w>e <C-w>k
nnoremap <C-w>k <C-w>n

" 改行を判定する
set fileformats=unix,mac,dos

" 文字コード自動判定
" source: http://d.hatena.ne.jp/osbaka/20060916/p1
" modified to use utf-8 as default
if &encoding !=# 'utf-8'
        set encoding=utf-8
endif
set fileencoding=utf-8
if has('iconv')
        let s:enc_euc = 'euc-jp'
        let s:enc_jis = 'iso-2022-jp'
        " iconvがJISX0213に対応しているかをチェック
        if iconv("?x87?x64?x87?x6a", 'cp932', 'euc-jisx0213') ==# "?xad?xc5?xad?xcb"
                let s:enc_euc = 'euc-jisx0213'
                let s:enc_jis = 'iso-2022-jp-3'
        endif
        " fileencodingsを構築
        if &encoding ==# 'utf-8'
                let s:fileencodings_default = &fileencodings
                let &fileencodings = s:enc_jis .','.  s:enc_euc .',cp932'
                let &fileencodings = &fileencodings .','.  s:fileencodings_default
                unlet s:fileencodings_default
        else
                let &fileencodings = &fileencodings .','.  s:enc_jis
                set fileencodings+=utf-8,ucs-2le,ucs-2
                if &encoding =~# '^euc-?%(jp?|jisx0213?)$'
                        set fileencodings+=cp932
                        set fileencodings-=euc-jp
                        set fileencodings-=euc-jisx0213
                        let &encoding = s:enc_euc
                else
                        let &fileencodings = &fileencodings .','.  s:enc_euc
                endif
        endif
        unlet s:enc_euc
        unlet s:enc_jis
endif

" Keymaps for plugins (Colemak)
" LustyExplorer
" http://www.vim.org/scripts/script.php?script_id=1890
" qwerty ,f
nmap ,t :FilesystemExplorer<CR>
" qwerty ,r
nmap ,p :FilesystemExplorerFromHere<CR>
" qwerty ,b
nmap ,b :BufferExplorer<CR>
