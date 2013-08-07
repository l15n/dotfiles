" Pathogen loads vim plugins from ~/.vim/bundle
filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" Vim options, categorized like :options
" 1. Important
set nocompatible

" Neobundle configuration
source $HOME/.vim/bundles.vim

" 2. moving around, searching and patterns
set incsearch
set ignorecase
set smartcase
" 4. displaying text
set scrolloff=999 " Lock cursor line to middle of screen ("Typewriter" scrolling")
set nonumber
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
" 21. command line editing
set history=100
" 24. multi-byte characters
" Treat ambiguous double-width characters (e.g.□星♪ etc) correctly
set ambiwidth=double
" Add sjis to fileencodings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis,default,latin1

filetype plugin indent on
syntax on

" Powerline
let g:Powerline_symbols = 'fancy'

set background=light
colorscheme solarized

" Highlight lines over 128 characters in length whenever a window opens
" From http://vim.wikia.com/wiki/Highlight_long_lines
if v:version >= 730
  :set cc=80,128
  :hi ColorColumn ctermbg=red guibg=red
elsif v:version >= 720
  :au BufWinEnter * let w:m1=matchadd('Search', '\%80v', -1)
  :au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%128v', -1)
elseif v:version >= 700
  :au BufRead,BufNewFile * syntax match Search /\%80v/
  :au BufRead,BufNewFile * syntax match ErrorMsg /\%128v/
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
let g:netrw_liststyle=1
let g:netrw_cursorline=3
let g:netrw_keepdir=1

" Unite
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200


" Workaround for cursor key problems in screen/tmux
map <Esc>[A <Up>
map <Esc>[B <Down>
map <Esc>[C <Right>
map <Esc>[D <Left>

" ft-ruby-syntax options
let ruby_minlines = 200
let ruby_operators = 1
let ruby_space_errors = 1

" Strip trailing whitespace
function StripTrailingWhitespaces()
	let pos = getpos(".")
	%s/\s\+$//e
	call setpos(".", pos)
endfunction

" Autocommands
autocmd BufWritePre * :call StripTrailingWhitespaces()

autocmd InsertEnter * :set number
autocmd WinLeave,Cmdwinenter * :set nonumber
autocmd WinLeave,CmdwinEnter * :set norelativenumber
autocmd WinEnter,BufWinEnter,InsertLeave * :set relativenumber

source $HOME/.vim/leaders.vim
