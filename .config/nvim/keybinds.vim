set pastetoggle=<F2>

inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
nnoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>

nnoremap <space> za

nnoremap <leader>t1  1gt
nnoremap <leader>t2  2gt
nnoremap <leader>t3  3gt
nnoremap <leader>t4  4gt
nnoremap <leader>t5  5gt
nnoremap <leader>t6  6gt
nnoremap <leader>t7  7gt
nnoremap <leader>t8  8gt
nnoremap <leader>t9  9gt
nnoremap <leader>t0  10gt

nnoremap <silent><leader>1  :BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2  :BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3  :BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4  :BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5  :BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6  :BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7  :BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8  :BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9  :BufferLineGoToBuffer 9<CR>
nnoremap <silent><leader>0  :BufferLineGoToBuffer 10<CR>
nnoremap <silent><leader>bp  :BufferLinePick<CR>
nnoremap <silent><leader>bq  :BufferLinePickClose<CR>
"nnoremap <silent><leader>bhq  :BufferLineCloseLeft<CR>
"nnoremap <silent><leader>blq  :BufferLineCloseRight<CR>
nnoremap <silent><leader>bh  :BufferLineMovePrev<CR>
nnoremap <silent><leader>bl  :BufferLineMoveNext<CR>

"Format code and organize all imports
function! CocFix()
  :call CocActionAsync('format')
  :call CocActionAsync('runCommand', 'editor.action.organizeImport')
endfunction

function! ToggleDiagnostics()
  if g:cocdiag == 1 
    let g:cocdiag = 0
    :lcl
  else
    let g:cocdiag = 1
    :CocDiagnostics
  endif
endfunction


command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

nmap <leader>f :call CocFix()<CR>

"nnoremap <C-d> <cmd>:NERDTreeToggle<CR>
nnoremap <C-d> :CHADopen<CR>
nnoremap <C-D> :CHADopen<CR>
nnoremap <C-p> :MarkdownPreview<CR>
nnoremap <leader>a :call ToggleDiagnostics()<CR>

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
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <s-tab> <c-p>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)

nmap <silent> <leader>K <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>J <Plug>(coc-diagnostic-next-error)

nmap <silent> <leader>sf :Files<CR>
nmap <silent> <leader>sm :Marks<CR>
nmap <silent> <leader>sb :Buffers<CR>
nmap <silent> <leader>st :Tags<CR>
nmap <silent> <leader>sl :Lines<CR>
nmap <silent> <leader>rg :Lines<CR>

nmap <leader>rn <Plug>(coc-rename)

command! -nargs=? Fold :call CocAction('fold', <f-args>)

nmap <leader>cl  <Plug>(coc-codelens-action)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <silent> K :call ShowDocumentation()<CR>


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
