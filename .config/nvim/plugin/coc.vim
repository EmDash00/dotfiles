function! CocFix()
  :call CocActionAsync('format')
  :call CocActionAsync('runCommand', 'editor.action.organizeImport')
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=? Fold :call CocAction('fold', <f-args>)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

command -bang -nargs=? QFix call QFixToggle(<bang>0)

function! ToggleDiagnostics()
  if g:cocdiag == 1 
    let g:cocdiag = 0
    :lcl
  else
    let g:cocdiag = 1
    :CocDiagnostics
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=? Fold :call CocAction('fold', <f-args>)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nnoremap <silent> <leader>j <Plug>(coc-diagnostic-next)

nnoremap <silent> <leader>K <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> <leader>J <Plug>(coc-diagnostic-next-error)

nnoremap <leader>cl  <Plug>(coc-codelens-action)
nnoremap <leader>ac  <Plug>(coc-codeaction)
nnoremap <leader>qf  <Plug>(coc-fix-current)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
