filetype off

source $HOME/.vim/options.vim
source $HOME/.vim/bundles.vim
source $HOME/.vim/plugin-options.vim
" Remap for colemak
source $HOME/.vim/simple-colemak.vim
source $HOME/.vim/leaders.vim

"nvim settings
set clipboard+=unnamedplus

" Use fzf via homebrew
set rtp+=/usr/local/opt/fzf

" Python X config
set pyxversion=3

" Configuration for using coc.vim
" https://github.com/neoclide/coc.nvim
source $HOME/.vim/coc-config.vim
