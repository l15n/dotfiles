" Neobundle configuration
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))


" Utilities
NeoBundle 'scrooloose/nerdtree'

" Tool integration
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rson/vim-conque'
NeoBundle 'mattn/gist-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

" Editing
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'tpope/vim-unimpaired'
" Unfortunately, vim singature interferes with split windows
NeoBundle 'kshenoy/vim-signature'
" Show marks also fails when splitting windows into panes
" NeoBundle 'vim-scripts/ShowMarks'

" Language specific
" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'csexton/jekyll.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'l15n/ri-browser'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'ngmy/vim-rubocop'

" JS/Coffee
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elzr/vim-json'

" Other
NeoBundle 'msanders/cocoa.vim'
NeoBundle 'othree/html5.vim'

" Theme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Other syntax
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'fatih/vim-go'

" New (Still learning)
"NeoBundle 'sickill/vim-pasta'
"NeoBundle 'ervandew/supertab'
"NeoBundle 'pix/vim-align'
"NeoBundle 'michaeljsmith/vim-indent-object'
"NeoBundle 'ddollar/nerdcommenter'
"NeoBundle 'spolu/dwm.vim'
"NeoBundle 'kana/vim-smartinput'
NeoBundle 'TailMinusF'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/neocomplete'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'lambdalisue/vim-gita'
"NeoBundle 'itchyny/lightline.vim'

filetype plugin indent on

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

