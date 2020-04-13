" Plugin manager: https://github.com/Shougo/dein.vim
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:dein#install_progress_type='tabline'

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  "
  " After adding, run `:call dein#update()` to update

  " Tools
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-projectionist')
  " Git wrapper
  "
  call dein#add('tpope/vim-fugitive')
  " fugitive extension for Github integration
  call dein#add('tpope/vim-rhubarb')
  " Asynchronous control of git repos.
  " Most useful for i/o like fetch, pull, push
  " :Gina push
  call dein#add('lambdalisue/gina.vim')
  " Call ripgrep with `:Rg`
  call dein#add('jremmen/vim-ripgrep')
  call dein#add('neoclide/coc.nvim', { 'merged':0,  'rev': 'release' })

  " Handy wrapper for fzf
  " :GFiles to navigate files
  call dein#add('junegunn/fzf.vim')

  " Editing
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('kshenoy/vim-signature')
  call dein#add('tpope/vim-repeat')

  " Language specific
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('joker1007/vim-ruby-heredoc-syntax')
  call dein#add('pangloss/vim-javascript')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('elzr/vim-json')
  call dein#add('othree/html5.vim')
  call dein#add('ingydotnet/yaml-vim')
  call dein#add('google/vim-jsonnet')
  call dein#add('leafgarland/typescript-vim')
  " call dein#add('peitalin/vim-jsx-typescript')
  " Seems like vim-jsx-pretty is preferred?
  call dein#add('MaxMEllon/vim-jsx-pretty')

  " Testing
  " vim-sneak is a movement command, triggered by `s` key in normal mode
  " `sxx` to go to all locations that match xx (two characters).
  " Similar to `f` and `t` keys in normal mode, but across entire file w/ 2
  " characters.
  " Use `;` to next instance or `3;` to third instance.
  " Use `Ctrl-o` to restart
  " Use `S` to do it in reverse
  "
  call dein#add('justinmk/vim-sneak')
  " vim-gtfo helps to "escape" vim
  " `gof` will open the Finder in directory of current file
  " `got` will open the Terminal in directory of current file
  call dein#add('justinmk/vim-gtfo')
  " Path Navigator: dirvish. Works well with unimpaired and eunuch.
  call dein#add('justinmk/vim-dirvish')
  " for use with dirvish, UNIX shell commands sugar
  call dein#add('tpope/vim-eunuch')

  call dein#add('junkblocker/patchreview-vim')
  call dein#add('codegram/vim-codereview')

  " UI
  call dein#add('fenetikm/falcon')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('itchyny/lightline.vim')


  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If install uninstalled plugins on startup.
if dein#check_install()
  call dein#install()
endif
