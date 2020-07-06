" Settings using bundled plugins
" Status-line with lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }


if &t_Co > 256
  set termguicolors
else
  set notermguicolors
endif

let g:falcon_lightline = 1
let g:lightline.colorscheme='falcon'

colorscheme falcon

" Highlight lines over 120 characters in length whenever a window opens
" From http://vim.wikia.com/wiki/Highlight_long_lines
if v:version >= 730
  :set colorcolumn=100
  :hi ColorColumn ctermbg=red guibg=red
elseif v:version >= 720
  :au BufWinEnter * let w:m1=matchadd('Search', '\%80v', -1)
  :au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%120v', -1)
elseif v:version >= 700
  :au BufRead,BufNewFile * syntax match Search /\%80v/
  :au BufRead,BufNewFile * syntax match ErrorMsg /\%120v/
endif

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

" ft-ruby-syntax options
let ruby_minlines = 200
let ruby_operators = 1
let ruby_space_errors = 1

" NERDTree
let g:NERDTreeMapOpenExpl='f'
" Strip trailing whitespace
function StripTrailingWhitespaces()
	let pos = getpos(".")
	%s/\s\+$//e
	call setpos(".", pos)
endfunction

" Autocommands
autocmd BufWritePre * :call StripTrailingWhitespaces()

" Ruby shortcuts
" - hashrocket conversion
nmap <Leader>h :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>
vmap <Leader>h :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>

" Projectionist
let g:projectionist_heuristics = {
      \   "*.gemspec": {
      \     "lib/*.rb": {
      \       "alternate": "spec/{}_spec.rb",
      \       "type": "source"
      \     },
      \     "spec/*_spec.rb": {
      \       "alternate": "lib/{}.rb",
      \       "type": "test"
      \     }
      \   }
      \ }

" Configuring vim-rhubarb for GHE https://github.com/tpope/vim-rhubarb
let g:github_enterprise_urls = ["https://ghe.ckpd.co"]
" Define the :Browse command for vim-rhubarb
command -nargs=1 Browse !open <args>


" Custom FZF commands
" :Find -  Use RipGrep on current directory with preview window
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
