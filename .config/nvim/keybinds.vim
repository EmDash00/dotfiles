set pastetoggle=<F2>

inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
nnoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>

nnoremap <space> za

nnoremap <leader>1  1gt
nnoremap <leader>2  2gt
nnoremap <leader>3  3gt
nnoremap <leader>4  4gt
nnoremap <leader>5  5gt
nnoremap <leader>6  6gt
nnoremap <leader>7  7gt
nnoremap <leader>8  8gt
nnoremap <leader>9  9gt
nnoremap <leader>0  10gt

nmap <leader>f <Plug>(ale_fix)
nmap <leader>a <Plug>(ale_toggle)
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

map <C-d> :NERDTreeToggle<CR>

"nnoremap <leader>g :YcmCompleter GoTo<CR>

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

vnoremap < <gv
vnoremap > >gv

inoremap  <c-space> <c-x><c-o>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <s-tab> <c-p>
