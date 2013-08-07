" Neobundle configuration
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))


" Utilities
NeoBundle 'scrooloose/nerdtree'
" TODO: Automate build
NeoBundle 'git://git.wincent.com/command-t.git'

" Tool integration
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rson/vim-conque'
NeoBundle 'mattn/gist-vim'
NeoBundle 'tpope/vim-fugitive'

" Editing
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'tpope/vim-unimpaired'

" Language specific
" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'csexton/jekyll.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'l15n/ri-browser'

" JS/Coffee
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

" Other
NeoBundle 'msanders/cocoa.vim'
NeoBundle 'othree/html5.vim'

" Theme
NeoBundle 'altercation/vim-colors-solarized'

" New (Still learning)
NeoBundle 'sickill/vim-pasta'
NeoBundle 'ervandew/supertab'
NeoBundle 'pix/vim-align'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'ddollar/nerdcommenter'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'TailMinusF'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Lokaltog/vim-powerline'

filetype plugin indent on

if neobundle#exists_not_installed_bundles()
				echomsg 'Not installed bundles : ' .
																\ string(neobundle#get_not_installed_bundle_names())
				echomsg 'Please execute ":NeoBundleInstall" command.'
endif
