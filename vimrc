" Vim options, categorized like :options
" 1. Important
set nocompatible
" 2. moving around, searching and patterns
set incsearch
" 4. displaying text
set scrolloff=999 " Lock cursor line to middle of screen ("Typewriter" scrolling")
set number
" 5. syntax, highlighting and spelling
set hlsearch
set cursorline
" 6. multiple windows
set laststatus=2
" 10. GUI
if has("gui_running")
  set guioptions-=m
  set guioptions-=T
endif
" 12. messages and info
set showcmd
set showmode
set ruler
set visualbell
set helplang=en
" 14. editing text
set backspace=indent,eol,start
set showmatch
" 15. tabs and indenting
set autoindent
" 17. diff mode
set diffopt=filler,iwhite,vertical
" 18. reading and writing files
set ml
set mls=2
" 19. reading and writing files
set autowrite
set fileformats=unix,mac,dos
" 21. command line editing
set history=100
" 25. multi-byte characters
" Treat ambiguous double-width characters (e.g.□星♪ etc) correctly
set ambiwidth=double

" Add sjis to fileencodings
set fileencodings=ucs-bom,utf-8,sjis,default,latin1

filetype plugin indent on
syntax on
" default colors
" Navajo colorscheme http://www.vim.org/scripts/script.php?script_id=190
color navajo

" Highlight lines over 120 characters in length whenever a window opens
" From http://vim.wikia.com/wiki/Highlight_long_lines
if v:version >= 720
  :au BufWinEnter * let w:m1=matchadd('Search', '\%<121v.\%>117v', -1)
  :au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
elseif v:version >= 700
  :au BufRead,BufNewFile * syntax match Search /\%<121v.\%>117v/
  :au BufRead,BufNewFile * syntax match ErrorMsg /\%>120v.\+/
endif

" Remap for colemak
source $HOME/.vim/simple-colemak.vim
" Load man.vim
runtime ftplugin/man.vim

" Plugin-specific settings
" taglist.vim
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
" netrw
let g:netrw_liststyle=3
let g:netrw_cursorline=3
let g:netrw_keepdir=0
