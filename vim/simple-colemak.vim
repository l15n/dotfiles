" Minimal remapping for colemak.
"
" Toggle Colemak bindings on and off
"
" Colemak
" qwfpgjluy;
" arstdhneio
" zxcvbkm

" Qwerty
" qwertyuiop
" asdfghjkl;
" zxcvbnm
"
" Stable keys:
"  top: qw
"  home: ah
"  bottom: zxcvbm

" TODO: Display keyboard type in status bar
function! ColemakToggle()
  if !exists("g:colemakEnabled")
    let g:colemakEnabled = 0
  endif
  if g:colemakEnabled
    call DisableColemakBindings()
    echo "Disabled Colemak"
  else
    call EnableColemakBindings()
    echo "Enabled Colemak"
  endif
endfunction

function! EnableColemakBindings()
  let g:colemakEnabled = 1
  " 1. Remap movement keys in Normal/Visual+Select/Operator-pending
  noremap n j
  noremap e k
  noremap i l

  " Also replace their uppercase equivalents for consistency
  noremap N J
  noremap E K
  noremap I L

  " Now, j/J,k/K,l/L are free
  " I also don't care about the following:
  "  s/S substitute (change.txt)
  "  t/T Till before the nth occurence of character to the right (motion.txt)
  "  ;,   Repeats f/F/t/T command
  " 2. Replace n/N with k/K (QWERTY)
  " Command: repeats latest / or ?
  noremap k n
  noremap K N
  " 3. Replace i/I with u/U (QWERTY)
  " Command: Insert mode
  noremap u i
  noremap U I
  " 4. Replace u/U with l/L (QWERTY)
  " Command: undo
  noremap l u
  noremap L U
  " 5. Use s/t (QWERTY position df) for page up/down
  " Note: Disabled so I can trial sneak.vim
  " nnoremap s <C-D>
  " nnoremap t <C-U>
  " nnoremap S <C-F>
  " nnoremap T <C-B>
  " Fix commands g* commands
  nnoremap ge gj
  nnoremap gu gk

  " Moving cursor to other windows
  nnoremap <C-w>n <C-w>j
  nnoremap <C-w>e <C-w>k
  nnoremap <C-w>i <C-w>l
  " Moving windows around
  nnoremap <C-w>N <C-w>J
  nnoremap <C-w>E <C-w>K
  nnoremap <C-w>I <C-w>L
  " Split window controls (other commands)
  nnoremap <C-w>k <C-w>n
  nnoremap <C-w>o <C-w>o

  " Minimal emacs keybindings copied from vimacs.vim
  " Pruned down to the most commonly used bindings.
  "
  " Command line editing
  "

  " Navigation
  cmap <C-b> <Left>
  cmap <C-f> <Right>
  cnoremap <M-f> <S-Right>
  cnoremap <M-b> <S-Left>
  cmap <C-a> <Home>
  cmap <C-e> <End>

  "
  " Navigation
  "

  " Insert/Visual/Operator mode maps
  imap <C-b> <Left>
  vmap <C-b> <Left>
  omap <C-b> <Left>
  imap <C-f> <Right>
  vmap <C-f> <Right>
  omap <C-f> <Right>
  imap <C-p> <Up>
  vmap <C-p> <Up>
  omap <C-p> <Up>
  imap <C-n> <Down>
  vmap <C-n> <Down>
  omap <C-n> <Down>
  imap <C-a> <Home>
  vmap <C-a> <Home>
  omap <C-a> <Home>
  imap <C-e> <End>
  vmap <C-e> <End>
  omap <C-e> <End>
  inoremap <C-v> <PageDown>
  vnoremap <C-v> <PageDown>
  onoremap <C-v> <PageDown>
  inoremap <M-v> <PageUp>
  vnoremap <M-v> <PageUp>
  onoremap <M-v> <PageUp>
endfunction

function! DisableColemakBindings()
  let g:colemakEnabled = 0
  " 1. Remap movement keys in Normal/Visual+Select/Operator-pending
  unmap n
  unmap e
  unmap i

  " Also replace their uppercase equivalents for consistency
  unmap N
  unmap E
  unmap I

  " Now, j/J,k/K,l/L are free
  " I also don't care about the following:
  "  s/S substitute (change.txt)
  "  t/T Till before the nth occurence of character to the right (motion.txt)
  "  ;,   Repeats f/F/t/T command
  " 2. Replace n/N with k/K (QWERTY)
  " Command: repeats latest / or ?
  unmap k
  unmap K
  " 3. Replace i/I with u/U (QWERTY)
  " Command: Insert mode
  unmap u
  unmap U
  " 4. Replace u/U with l/L (QWERTY)
  " Command: undo
  unmap l
  unmap L
  " 5. Use s/t (QWERTY position df) for page up/down
  " Note: Disabled so I can trial sneak.vim
  " nunmap s
  " nunmap t
  " nunmap S
  " nunmap T
  " Fix commands g* commands
  nunmap ge
  nunmap gu

  " Moving cursor to other windows
  nunmap <C-w>n
  nunmap <C-w>e
  nunmap <C-w>i
  " Moving windows around
  nunmap <C-w>N
  nunmap <C-w>E
  nunmap <C-w>I
  " Split window controls (other commands)
  nunmap <C-w>k
  nunmap <C-w>o

  " Minimal emacs keybindings copied from vimacs.vim
  " Pruned down to the most commonly used bindings.
  "
  " Command line editing
  "

  " Navigation
  cunmap <C-b>
  cunmap <C-f>
  cunmap <M-f>
  cunmap <M-b>
  cunmap <C-a>
  cunmap <C-e>

  "
  " Navigation
  "

  " Insert/Visual/Operator mode maps
  iunmap <C-b>
  vunmap <C-b>
  ounmap <C-b>
  iunmap <C-f>
  vunmap <C-f>
  ounmap <C-f>
  iunmap <C-p>
  vunmap <C-p>
  ounmap <C-p>
  iunmap <C-n>
  vunmap <C-n>
  ounmap <C-n>
  iunmap <C-a>
  vunmap <C-a>
  ounmap <C-a>
  iunmap <C-e>
  vunmap <C-e>
  ounmap <C-e>
  iunmap <C-v>
  vunmap <C-v>
  ounmap <C-v>
  iunmap <M-v>
  vunmap <M-v>
  ounmap <M-v>
endfunction

" Default to use colemak
call EnableColemakBindings()
