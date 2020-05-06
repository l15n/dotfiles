" Vim options, categorized like :options
" 1. Important
set nocompatible

" 2. moving around, searching and patterns
set incsearch
set ignorecase
set smartcase
" 4. displaying text
" set scrolloff=999 " Lock cursor line to middle of screen ("Typewriter" scrolling")
set nonumber
set nolist
"set listchars=eol:⨼,tab:⨠-,trail:~,nbsp:∙,precedes:<,extends:>
" 5. syntax, highlighting and spelling
set hlsearch
set cursorline
" 6. multiple windows
set laststatus=2
" Custom statusline from:
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
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
set backupdir=~/.vim/tmp
" 20. the swap file
set directory=~/.vim/tmp
" 21. command line editing
set history=100
set undodir=~/.vim/tmp
" 24. multi-byte characters
" Treat ambiguous double-width characters (e.g.□星♪ etc) correctly
set ambiwidth=double

" Add sjis to fileencodings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis,default,latin1
