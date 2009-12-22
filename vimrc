" Remap for colemak
source $HOME/.vim/simple-colemak.vim
" default colors
color delek
" Options
set nocompatible
set ruler
set showmode
set showmatch
set showcmd
set ignorecase

" Highlight lines over 120 characters in length whenever a window opens
" From http://vim.wikia.com/wiki/Highlight_long_lines
if v:version >= 720
  :au BufWinEnter * let w:m1=matchadd('Search', '\%<121v.\%>117v', -1)
  :au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
elseif v:version >= 700
  :au BufRead,BufNewFile * syntax match Search /\%<121v.\%>117v/
  :au BufRead,BufNewFile * syntax match ErrorMsg /\%>120v.\+/
endif


set autoindent
set autowrite

set backspace=2
set history=1000
set noincsearch
set hlsearch

set number
set laststatus=2

" Treat ambiguous doublewidth characters (e.g.□星♪ etc) correctly
set ambiwidth=double

syntax on

filetype plugin indent on

"" 改行を判定する
set fileformats=unix,mac,dos
