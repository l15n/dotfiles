filetype off

" Pull in configuration from vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source $HOME/.vim/options.vim
source $HOME/.vim/bundles.vim
source $HOME/.vim/plugin-options.vim
" Remap for colemak
source $HOME/.vim/simple-colemak.vim
source $HOME/.vim/leaders.vim

"nvim settings
set clipboard+=unnamedplus

" Use fzf via homebrew
" Note: If brew is in /opt/brew, then add a symbolic link to /opt/brew/opt
set rtp+=/usr/local/opt/fzf

" Python X config
set pyxversion=3

" Configuration for using coc.vim
" https://github.com/neoclide/coc.nvim
"source $HOME/.vim/coc-config.vim

language en_US.UTF-8
