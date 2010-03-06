" Minimal remapping for colemak.
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
"
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
nnoremap s <C-D>
nnoremap t <C-U>
nnoremap S <C-F>
nnoremap T <C-B>
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
