" NERDTree
nnoremap <Leader>nn :NERDTree %:h<CR>
nnoremap <Leader>nt :NERDTreeToggle %:h<CR>
nnoremap <Leader>nc :NERDTreeClose<CR>

" Fugitive
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<Space>

" Gitv
nnoremap <Leader>gv :Gitv<CR>

" Unite
nnoremap <Leader>t :Unite -start-insert buffer file_rec/async<CR>
nnoremap <Leader>f :Unite -start-insert file<CR>
nnoremap <Leader>a :Unite grep:.<CR>
nnoremap <Leader>b :Unite -start-insert buffer<CR>

" Rails
nnoremap <Leader>rv :Eview<SPACE>
nnoremap <Leader>rc :Econtroller<SPACE>
nnoremap <Leader>rm :Emodel<SPACE>
nnoremap <Leader>rs :Espec<SPACE>

" Colemak

nnoremap <leader>c :call ColemakToggle()<cr>
